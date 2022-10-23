import 'package:find_jobs/models/job_category_model.dart';
import 'package:find_jobs/services/job_service.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  List<JobCategoryModel> _categories = [];

  List<JobCategoryModel> get categories => _categories;

  set categories(List<JobCategoryModel> categories) {
    _categories = categories;
    notifyListeners();
  }

  Future<List<JobCategoryModel>> getCategories() async {
    JobService jobService = JobService();
    List<JobCategoryModel> categories = await jobService.getCategories();
    return categories;
  }
}
