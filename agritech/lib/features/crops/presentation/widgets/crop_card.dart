import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/crop.dart';

class CropCard extends StatelessWidget {
  final Crop crop;

  const CropCard({super.key, required this.crop});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: "Crop card for ${crop.name}",
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Image with semantic label
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: crop.thumbnail,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 160,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 160,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error, color: Colors.red, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // ✅ Title (scales with system font)
              Text(
                crop.name,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                softWrap: true,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 8),

              // ✅ Details (multiline, responsive)
              Text(
                crop.details,
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 12),

              // ✅ Responsive info section (Wrap prevents overflow)
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  Text("🌱 Season: ${crop.season}",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("💧 Water: ${crop.waterRequirement}",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("🌍 Soil: ${crop.soilType}",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("⏳ Duration: ${crop.duration}",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("💰 Price: ₹${crop.pricePerQuintal}/Quintal",
                      style: Theme.of(context).textTheme.bodySmall),
                  Text("📍 Origin: ${crop.origin}",
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
