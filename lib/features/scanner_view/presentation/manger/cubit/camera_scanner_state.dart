part of 'camera_scanner_cubit.dart';

sealed class CameraScannerState extends Equatable {
  const CameraScannerState();

  @override
  List<Object> get props => [];
}

final class CameraScannerInitial extends CameraScannerState {}

class OcrProcessing extends CameraScannerState {
  const OcrProcessing(this.isProcessing);
  final bool isProcessing;

  @override
  List<Object> get props => [isProcessing];
}

class OcrImagePicked extends CameraScannerState {
  const OcrImagePicked(this.image);
  final File image;

  @override
  List<Object> get props => [image];
}

class OcrTextScanned extends CameraScannerState {
  const OcrTextScanned(this.scannedText);
  final String scannedText;

  @override
  List<Object> get props => [scannedText];
}

class OcrError extends CameraScannerState {
  const OcrError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
