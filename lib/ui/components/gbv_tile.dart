import 'package:bertucanfrontend/core/models/freezed_models.dart';
import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';

class GbvTile extends StatelessWidget {
  final Gbv gbv;
  final Function() onTap;
  const GbvTile({Key? key, required this.gbv, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.all(10),
        color: Colors.white,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(gbv.logo ??
                    "https://api.lorem.space/image/face?hash=92310"),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gbv.name ?? "",
                      style: AppTheme.titleStyle2.copyWith(fontSize: 16)),
                  SizedBox(
                    width: 100,
                    child: Text(
                      gbv.description ?? "",
                      style: AppTheme.greySubtitleStyle
                          .copyWith(fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right,
            color: AppTheme.primaryColor,
            size: 30,
          ),
        ]),
      ),
    );
  }
}
