import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_project/features/publish/repo/publish_repository.dart';
import 'publish_state.dart';

class PublishCubit extends Cubit<PublishState> {
  final PublishRepository repo;
  final ImagePicker _picker = ImagePicker();

  PublishCubit(this.repo) : super(const PublishState());

  // ---------------- STEP 1 ----------------

  void updateTitle(String value) =>
      emit(state.copyWith(title: value, clearError: true));

  void updateDescription(String value) =>
      emit(state.copyWith(description: value, clearError: true));

  void updateAbstract(String value) =>
      emit(state.copyWith(abstractText: value, clearError: true));

  void updateCategory(int? id) =>
      emit(state.copyWith(categoryId: id, clearError: true));

  Future<void> pickCoverImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      emit(state.copyWith(coverImage: File(picked.path), clearError: true));
    }
  }

  List<Map<String, dynamic>> categories = [];

  Future<void> loadCategories() async {
    final data = await repo.getCategories();
    categories = data;
    emit(state.copyWith());
  }

  // ---------------- STEP 2 ----------------

  void updateContent(String value) =>
      emit(state.copyWith(content: value, clearError: true));

  void updateTagsString(String value) =>
      emit(state.copyWith(tagsString: value, clearError: true));

  void updateLocation(String value) =>
      emit(state.copyWith(location: value, clearError: true));

  Future<void> pickPdfFile() async {
    final picked = await _picker.pickImage(
      source: ImageSource.gallery,
    ); // استبدلها بـ FilePicker لو حابب لاحقاً
    if (picked != null) {
      emit(state.copyWith(pdfFile: File(picked.path), clearError: true));
    }
  }

  Future<void> addMediaFile() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final list = List<File>.from(state.mediaFiles)..add(File(picked.path));
      emit(state.copyWith(mediaFiles: list, clearError: true));
    }
  }

  // ---------------- STEP 3 ----------------

  void updateStatus(String? value) {
    if (value == null) return;
    emit(state.copyWith(status: value, clearError: true));
  }

  void updateAccessLevel(String? value) {
    if (value == null) return;
    emit(state.copyWith(accessLevel: value, clearError: true));
  }

  // ---------------- SUBMIT ----------------

  Future<void> submit() async {
    // تحقق بسيط لحقول Step1 الأساسية
    if (state.title.isEmpty ||
        state.categoryId == null ||
        state.coverImage == null) {
      emit(
        state.copyWith(
          errorMessage:
              'Please fill required fields in Step 1 (title, category, cover).',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, clearError: true));

    try {
      await repo.createArticle(
        title: state.title,
        abstractText: state.abstractText.isEmpty ? null : state.abstractText,
        description: state.description.isEmpty ? null : state.description,
        content: state.content.isEmpty ? null : state.content,
        categoryId: state.categoryId!,
        coverImage: state.coverImage!,
        pdfFile: state.pdfFile,
        status: state.status,
        accessLevel: state.accessLevel,
        tags: state.tagsString.isEmpty ? null : state.tagsString,
        location: state.location.isEmpty ? null : state.location,
      );

      emit(state.copyWith(isLoading: false, isSubmitted: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
