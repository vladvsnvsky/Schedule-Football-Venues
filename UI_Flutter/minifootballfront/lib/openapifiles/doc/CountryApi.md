# openapi.api.CountryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiCountryCreatePost**](CountryApi.md#apicountrycreatepost) | **POST** /api/Country/create | 
[**apiCountryDeleteIdDelete**](CountryApi.md#apicountrydeleteiddelete) | **DELETE** /api/Country/delete/{id} | 
[**apiCountryGet**](CountryApi.md#apicountryget) | **GET** /api/Country | 
[**apiCountryGetIdGet**](CountryApi.md#apicountrygetidget) | **GET** /api/Country/get/{id} | 
[**apiCountryUpdateIdPut**](CountryApi.md#apicountryupdateidput) | **PUT** /api/Country/update/{id} | 


# **apiCountryCreatePost**
> CountryDTO apiCountryCreatePost(createCountryDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CountryApi();
final createCountryDTO = CreateCountryDTO(); // CreateCountryDTO | 

try {
    final result = api_instance.apiCountryCreatePost(createCountryDTO);
    print(result);
} catch (e) {
    print('Exception when calling CountryApi->apiCountryCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCountryDTO** | [**CreateCountryDTO**](CreateCountryDTO.md)|  | [optional] 

### Return type

[**CountryDTO**](CountryDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryDeleteIdDelete**
> apiCountryDeleteIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CountryApi();
final id = 56; // int | 

try {
    api_instance.apiCountryDeleteIdDelete(id);
} catch (e) {
    print('Exception when calling CountryApi->apiCountryDeleteIdDelete: $e\n');
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

# **apiCountryGet**
> List<CountryDTO> apiCountryGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CountryApi();

try {
    final result = api_instance.apiCountryGet();
    print(result);
} catch (e) {
    print('Exception when calling CountryApi->apiCountryGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<CountryDTO>**](CountryDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryGetIdGet**
> CountryDTO apiCountryGetIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CountryApi();
final id = 56; // int | 

try {
    final result = api_instance.apiCountryGetIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling CountryApi->apiCountryGetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**CountryDTO**](CountryDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiCountryUpdateIdPut**
> CountryDTO apiCountryUpdateIdPut(id, createCountryDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = CountryApi();
final id = 56; // int | 
final createCountryDTO = CreateCountryDTO(); // CreateCountryDTO | 

try {
    final result = api_instance.apiCountryUpdateIdPut(id, createCountryDTO);
    print(result);
} catch (e) {
    print('Exception when calling CountryApi->apiCountryUpdateIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **createCountryDTO** | [**CreateCountryDTO**](CreateCountryDTO.md)|  | [optional] 

### Return type

[**CountryDTO**](CountryDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

