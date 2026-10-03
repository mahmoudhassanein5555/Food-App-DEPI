import 'package:flutter/material.dart';
import 'package:food_app_depi/core/utils/app_colors.dart';
import 'package:food_app_depi/core/utils/app_string.dart';
import 'package:food_app_depi/features/orders/models/order_item.dart';
import 'package:food_app_depi/features/orders/widgets/order_actions.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});

  final OrderItem order;

  @override
  Widget build(BuildContext context) {
    final details = <Widget>[
      Text(
        '${AppString.currencySymbol}${order.price.toStringAsFixed(2)}',
        style: const TextStyle(
          color: AppColors.textDarkest,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      const _DetailsDivider(),
      if (order.date != null) ...[
        Flexible(
          child: Text(
            order.date!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.mutedGray, fontSize: 10),
          ),
        ),
        const _DetailsDot(),
      ],
      Flexible(
        child: Text(
          AppString.orderItemCountTemplate.replaceFirst(
            '{count}',
              order.itemCount.toString().padLeft(2, '0'),
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.mutedGray, fontSize: 10),
        ),
      ),
    ];

    return Column(
      children: [
        Row(
          children: [
            OrderThumbnail(imageUrl: order.imageUrl),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          order.restaurantName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: AppColors.textDarkest,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        AppString.orderNumberTemplate.replaceFirst(
                          '{number}',
                          order.orderNumber,
                        ),
                        style: const TextStyle(
                          color: AppColors.mutedGray,
                          fontSize: 11,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(children: details),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        OrderActions(isHistory: order.isHistory),
      ],
    );
  }
}

class OrderThumbnail extends StatelessWidget {
  const OrderThumbnail({super.key, required this.imageUrl});
  
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Image.asset(
        imageUrl,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _DetailsDivider extends StatelessWidget {
  const _DetailsDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 14,
      width: 1,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.borderGray,
    );
  }
}

class _DetailsDot extends StatelessWidget {
  const _DetailsDot();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 3,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: const BoxDecoration(
        color: AppColors.mutedGray,
        shape: BoxShape.circle,
      ),
    );
  }
}
