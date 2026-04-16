import 'dart:io';

class PublishState {
  // STEP 1
  final String title;
  final String description;
  final String abstractText;
  final int? categoryId;
  final File? coverImage;

  // STEP 2
  final String content; // المحتوى الكامل
  final File? pdfFile; // ملف PDF
  final List<File> mediaFiles; // صور/ميديا إضافية (لـ UI فقط)
  final String tagsString; // "ai, flutter, research"
  final String location;

  // STEP 3
  final String status; // draft / published / under_review
  final String accessLevel; // public / private / institutional

  // META
  final bool isLoading;
  final String? errorMessage;
  final bool isSubmitted;
  final bool isDraftSaved;

  const PublishState({
    this.title = '',
    this.description = '',
    this.abstractText = '',
    this.categoryId,
    this.coverImage,
    this.content = '',
    this.pdfFile,
    this.mediaFiles = const [],
    this.tagsString = '',
    this.location = '',
    this.status = 'draft',
    this.accessLevel = 'public',
    this.isLoading = false,
    this.errorMessage,
    this.isSubmitted = false,
    this.isDraftSaved = false,
  });

  PublishState copyWith({
    String? title,
    String? description,
    String? abstractText,
    int? categoryId,
    File? coverImage,
    String? content,
    File? pdfFile,
    List<File>? mediaFiles,
    String? tagsString,
    String? location,
    String? status,
    String? accessLevel,
    bool? isLoading,
    String? errorMessage,
    bool? isSubmitted,
    bool? isDraftSaved,
    bool clearError = false,
  }) {
    return PublishState(
      title: title ?? this.title,
      description: description ?? this.description,
      abstractText: abstractText ?? this.abstractText,
      categoryId: categoryId ?? this.categoryId,
      coverImage: coverImage ?? this.coverImage,
      content: content ?? this.content,
      pdfFile: pdfFile ?? this.pdfFile,
      mediaFiles: mediaFiles ?? this.mediaFiles,
      tagsString: tagsString ?? this.tagsString,
      location: location ?? this.location,
      status: status ?? this.status,
      accessLevel: accessLevel ?? this.accessLevel,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isDraftSaved: isDraftSaved ?? this.isDraftSaved,
    );
  }
}
