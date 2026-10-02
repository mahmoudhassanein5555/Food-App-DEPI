import os
import re

app_colors_path = 'lib/core/app_colors.dart'

with open(app_colors_path, 'r', encoding='utf-8') as f:
    app_colors_content = f.read()

color_full_pattern = re.compile(r'static const Color (\w+) = ([^;]+);')

hex_to_names = {}
name_to_val = {}
name_to_hex = {}
order = []

for match in color_full_pattern.finditer(app_colors_content):
    name = match.group(1)
    val = match.group(2).strip()
    
    order.append(name)
    name_to_val[name] = val
    
    hex_match = re.search(r'Color\((0x[A-Fa-f0-9]{8})\)', val)
    if hex_match:
        hex_val = hex_match.group(1).upper()
        if hex_val not in hex_to_names:
            hex_to_names[hex_val] = []
        hex_to_names[hex_val].append(name)
        name_to_hex[name] = hex_val

alias_map = {}
to_delete = set()

# deduplicate
for hex_val, names in hex_to_names.items():
    if len(names) > 1:
        # Keep the first one, or maybe the shortest name? Let's just keep the first one
        primary = names[0]
        for duplicate in names[1:]:
            alias_map[duplicate] = primary
            to_delete.add(duplicate)

# replace in codebase
for root, _, files in os.walk('lib'):
    for f in files:
        if f.endswith('.dart'):
            filepath = os.path.join(root, f)
            with open(filepath, 'r', encoding='utf-8') as f_in:
                content = f_in.read()
            
            original = content
            
            for dup, prim in alias_map.items():
                content = re.sub(r'AppColors\.' + dup + r'\b', f'AppColors.{prim}', content)
            
            if content != original:
                with open(filepath, 'w', encoding='utf-8') as f_out:
                    f_out.write(content)

# rewrite app_colors.dart
new_app_colors_content = '''import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

'''
for name in order:
    if name not in to_delete:
        new_app_colors_content += f'  static const Color {name} = {name_to_val[name]};\n'

# We also had gradient in home_ui_colors.dart! Wait, it wasn't a Color, so the previous script missed it.
new_app_colors_content += '''
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.orange, AppColors.primaryLight],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
'''

new_app_colors_content += '}\n'

with open(app_colors_path, 'w', encoding='utf-8') as f:
    f.write(new_app_colors_content)

print("Deduplicated colors")
