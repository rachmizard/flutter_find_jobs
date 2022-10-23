import 'dart:convert';

import 'package:find_jobs/services/request_adapter_service.dart';
import 'package:find_jobs/models/job_category_model.dart';

class JobService with RequestAdapterService {
  Future<List<JobCategoryModel>> getCategories() async {
    try {
      final response = await sendGetRequest('$baseURL/categories');
      final data = jsonDecode(response.body) as List;

      final categories = data.map((e) => JobCategoryModel.fromJson(e)).toList();
      return categories;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
