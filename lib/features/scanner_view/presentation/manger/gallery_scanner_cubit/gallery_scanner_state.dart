part of 'gallery_scanner_cubit.dart';

sealed class GalleryScannerState extends Equatable {
  const GalleryScannerState();

  @override
  List<Object> get props => [];
}

final class GalleryScannerInitial extends GalleryScannerState {}

class OcrProcessing extends GalleryScannerState {
  const OcrProcessing(this.isProcessing);
  final bool isProcessing;

  @override
  List<Object> get props => [isProcessing];
}

class OcrImagePicked extends GalleryScannerState {
  const OcrImagePicked(this.image);
  final File image;

  @override
  List<Object> get props => [image];
}

class OcrTextScanned extends GalleryScannerState {
  const OcrTextScanned(this.scannedText);
  final String scannedText;

  @override
  List<Object> get props => [scannedText];
}

class OcrError extends GalleryScannerState {
  const OcrError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
