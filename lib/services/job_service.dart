import 'dart:convert';

import 'package:find_jobs/models/job_model.dart';
import 'package:find_jobs/services/request_adapter_service.dart';
import 'package:find_jobs/models/job_category_model.dart';

class JobService with RequestAdapterService {
  Future<List<JobCategoryModel>> getCategories(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await sendGetRequest(
          uri: "/categories", queryParameters: queryParameters);
      final data = jsonDecode(response.body) as List;

      final categories = data.map((e) => JobCategoryModel.fromJson(e)).toList();
      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<JobModel>> getJobs({String? category}) async {
    try {
      final response = await sendGetRequest(uri: "/jobs", queryParameters: {
        "category": category,
      });
      final data = jsonDecode(response.body) as List;

      final categories = data.map((e) => JobModel.fromJson(e)).toList();
      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
