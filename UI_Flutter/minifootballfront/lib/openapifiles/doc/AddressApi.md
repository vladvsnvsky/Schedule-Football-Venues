# openapi.api.AddressApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAddressByUserIdGet**](AddressApi.md#apiaddressbyuseridget) | **GET** /api/Address/by-user-id | 
[**apiAddressByVenueIdGet**](AddressApi.md#apiaddressbyvenueidget) | **GET** /api/Address/by-venue-id | 
[**apiAddressCreateAddressPost**](AddressApi.md#apiaddresscreateaddresspost) | **POST** /api/Address/create-address | 
[**apiAddressDeleteDelete**](AddressApi.md#apiaddressdeletedelete) | **DELETE** /api/Address/delete | 
[**apiAddressGetAllGet**](AddressApi.md#apiaddressgetallget) | **GET** /api/Address/get-all | 
[**apiAddressGetGet**](AddressApi.md#apiaddressgetget) | **GET** /api/Address/get | 
[**apiAddressUpdatePut**](AddressApi.md#apiaddressupdateput) | **PUT** /api/Address/update | 


# **apiAddressByUserIdGet**
> AddressDTO apiAddressByUserIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final id = 56; // int | 

try {
    final result = api_instance.apiAddressByUserIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressByUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressByVenueIdGet**
> AddressDTO apiAddressByVenueIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final id = 56; // int | 

try {
    final result = api_instance.apiAddressByVenueIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressByVenueIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressCreateAddressPost**
> AddressDTO apiAddressCreateAddressPost(createAddressDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final createAddressDTO = CreateAddressDTO(); // CreateAddressDTO | 

try {
    final result = api_instance.apiAddressCreateAddressPost(createAddressDTO);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressCreateAddressPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAddressDTO** | [**CreateAddressDTO**](CreateAddressDTO.md)|  | [optional] 

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressDeleteDelete**
> apiAddressDeleteDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final id = 56; // int | 

try {
    api_instance.apiAddressDeleteDelete(id);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressGetAllGet**
> List<AddressDTO> apiAddressGetAllGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();

try {
    final result = api_instance.apiAddressGetAllGet();
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressGetAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<AddressDTO>**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressGetGet**
> AddressDTO apiAddressGetGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final id = 56; // int | 

try {
    final result = api_instance.apiAddressGetGet(id);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressGetGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiAddressUpdatePut**
> AddressDTO apiAddressUpdatePut(id, createAddressDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AddressApi();
final id = 56; // int | 
final createAddressDTO = CreateAddressDTO(); // CreateAddressDTO | 

try {
    final result = api_instance.apiAddressUpdatePut(id, createAddressDTO);
    print(result);
} catch (e) {
    print('Exception when calling AddressApi->apiAddressUpdatePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 
 **createAddressDTO** | [**CreateAddressDTO**](CreateAddressDTO.md)|  | [optional] 

### Return type

[**AddressDTO**](AddressDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

