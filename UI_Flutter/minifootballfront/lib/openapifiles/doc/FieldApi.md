# openapi.api.FieldApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiFieldAvailableHoursGet**](FieldApi.md#apifieldavailablehoursget) | **GET** /api/Field/available-hours | 
[**apiFieldCreatePost**](FieldApi.md#apifieldcreatepost) | **POST** /api/Field/create | 
[**apiFieldDeleteIdDelete**](FieldApi.md#apifielddeleteiddelete) | **DELETE** /api/Field/delete/{id} | 
[**apiFieldGetByCityIdGet**](FieldApi.md#apifieldgetbycityidget) | **GET** /api/Field/get-by-city/{id} | 
[**apiFieldGetByCityPaginatedGet**](FieldApi.md#apifieldgetbycitypaginatedget) | **GET** /api/Field/get-by-city-paginated | 
[**apiFieldGetIdGet**](FieldApi.md#apifieldgetidget) | **GET** /api/Field/get/{id} | 
[**apiFieldSetActivePut**](FieldApi.md#apifieldsetactiveput) | **PUT** /api/Field/set-active | 
[**apiFieldSetInactivePut**](FieldApi.md#apifieldsetinactiveput) | **PUT** /api/Field/set-inactive | 
[**apiFieldUpdateByIdPut**](FieldApi.md#apifieldupdatebyidput) | **PUT** /api/Field/update-by-id | 
[**apiFieldVenueDetailsByCityIdGet**](FieldApi.md#apifieldvenuedetailsbycityidget) | **GET** /api/Field/venue-details-by-city-id | 
[**apiFieldVenueDetailsByidGet**](FieldApi.md#apifieldvenuedetailsbyidget) | **GET** /api/Field/venue-details-byid | 
[**apiFieldVenueDetailsGet**](FieldApi.md#apifieldvenuedetailsget) | **GET** /api/Field/venue-details | 


# **apiFieldAvailableHoursGet**
> List<TimeSpan> apiFieldAvailableHoursGet(day, month, year, fieldId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final day = 56; // int | 
final month = 56; // int | 
final year = 56; // int | 
final fieldId = 56; // int | 

try {
    final result = api_instance.apiFieldAvailableHoursGet(day, month, year, fieldId);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldAvailableHoursGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **day** | **int**|  | [optional] 
 **month** | **int**|  | [optional] 
 **year** | **int**|  | [optional] 
 **fieldId** | **int**|  | [optional] 

### Return type

[**List<TimeSpan>**](TimeSpan.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldCreatePost**
> apiFieldCreatePost(createFieldDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final createFieldDTO = CreateFieldDTO(); // CreateFieldDTO | 

try {
    api_instance.apiFieldCreatePost(createFieldDTO);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFieldDTO** | [**CreateFieldDTO**](CreateFieldDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldDeleteIdDelete**
> apiFieldDeleteIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 

try {
    api_instance.apiFieldDeleteIdDelete(id);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldDeleteIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldGetByCityIdGet**
> List<FieldDTO> apiFieldGetByCityIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 

try {
    final result = api_instance.apiFieldGetByCityIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldGetByCityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**List<FieldDTO>**](FieldDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldGetByCityPaginatedGet**
> VenueDetailsDTOPaginatedResponse apiFieldGetByCityPaginatedGet(cityId, pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final cityId = 56; // int | 
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.apiFieldGetByCityPaginatedGet(cityId, pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldGetByCityPaginatedGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**VenueDetailsDTOPaginatedResponse**](VenueDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldGetIdGet**
> FieldDTO apiFieldGetIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 

try {
    final result = api_instance.apiFieldGetIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldGetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**FieldDTO**](FieldDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldSetActivePut**
> FieldDTOUpdateRequestResponse apiFieldSetActivePut(fieldId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final fieldId = 56; // int | 

try {
    final result = api_instance.apiFieldSetActivePut(fieldId);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldSetActivePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fieldId** | **int**|  | [optional] 

### Return type

[**FieldDTOUpdateRequestResponse**](FieldDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldSetInactivePut**
> FieldDTOUpdateRequestResponse apiFieldSetInactivePut(fieldId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final fieldId = 56; // int | 

try {
    final result = api_instance.apiFieldSetInactivePut(fieldId);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldSetInactivePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fieldId** | **int**|  | [optional] 

### Return type

[**FieldDTOUpdateRequestResponse**](FieldDTOUpdateRequestResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldUpdateByIdPut**
> FieldDTO apiFieldUpdateByIdPut(id, venueDetailsDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 
final venueDetailsDTO = VenueDetailsDTO(); // VenueDetailsDTO | 

try {
    final result = api_instance.apiFieldUpdateByIdPut(id, venueDetailsDTO);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldUpdateByIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 
 **venueDetailsDTO** | [**VenueDetailsDTO**](VenueDetailsDTO.md)|  | [optional] 

### Return type

[**FieldDTO**](FieldDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldVenueDetailsByCityIdGet**
> List<VenueDetailsDTO> apiFieldVenueDetailsByCityIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 

try {
    final result = api_instance.apiFieldVenueDetailsByCityIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldVenueDetailsByCityIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**List<VenueDetailsDTO>**](VenueDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldVenueDetailsByidGet**
> VenueDetailsDTO apiFieldVenueDetailsByidGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();
final id = 56; // int | 

try {
    final result = api_instance.apiFieldVenueDetailsByidGet(id);
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldVenueDetailsByidGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**VenueDetailsDTO**](VenueDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiFieldVenueDetailsGet**
> List<VenueDetailsDTO> apiFieldVenueDetailsGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = FieldApi();

try {
    final result = api_instance.apiFieldVenueDetailsGet();
    print(result);
} catch (e) {
    print('Exception when calling FieldApi->apiFieldVenueDetailsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<VenueDetailsDTO>**](VenueDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

