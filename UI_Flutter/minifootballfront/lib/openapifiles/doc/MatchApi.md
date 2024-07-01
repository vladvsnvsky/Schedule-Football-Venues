# openapi.api.MatchApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**matchActiveByCityGet**](MatchApi.md#matchactivebycityget) | **GET** /Match/active-by-city | 
[**matchActiveByCityPaginatedGet**](MatchApi.md#matchactivebycitypaginatedget) | **GET** /Match/active-by-city-paginated | 
[**matchActiveByFieldGet**](MatchApi.md#matchactivebyfieldget) | **GET** /Match/active-by-field | 
[**matchActiveByPlayerGet**](MatchApi.md#matchactivebyplayerget) | **GET** /Match/active-by-player | 
[**matchActiveGet**](MatchApi.md#matchactiveget) | **GET** /Match/active | 
[**matchByFiltersGet**](MatchApi.md#matchbyfiltersget) | **GET** /Match/by-filters | 
[**matchByIdGet**](MatchApi.md#matchbyidget) | **GET** /Match/by-id | 
[**matchByPlayerGet**](MatchApi.md#matchbyplayerget) | **GET** /Match/by-player | 
[**matchCancelPut**](MatchApi.md#matchcancelput) | **PUT** /Match/cancel | 
[**matchGet**](MatchApi.md#matchget) | **GET** /Match | 
[**matchGetAllActiveByGameTypePaginatorGet**](MatchApi.md#matchgetallactivebygametypepaginatorget) | **GET** /Match/get-all-active-by-game-type-paginator | 
[**matchGetAllActiveByStartTimePaginatorGet**](MatchApi.md#matchgetallactivebystarttimepaginatorget) | **GET** /Match/get-all-active-by-start-time-paginator | 
[**matchGetAllByGameTypePaginatorGet**](MatchApi.md#matchgetallbygametypepaginatorget) | **GET** /Match/get-all-by-game-type-paginator | 
[**matchGetAllByStartTimePaginatorGet**](MatchApi.md#matchgetallbystarttimepaginatorget) | **GET** /Match/get-all-by-start-time-paginator | 
[**matchGetAllJoinableByGameTypePaginatorGet**](MatchApi.md#matchgetalljoinablebygametypepaginatorget) | **GET** /Match/get-all-joinable-by-game-type-paginator | 
[**matchGetAllJoinableByStartTimePaginatorGet**](MatchApi.md#matchgetalljoinablebystarttimepaginatorget) | **GET** /Match/get-all-joinable-by-start-time-paginator | 
[**matchIdDelete**](MatchApi.md#matchiddelete) | **DELETE** /Match/{id} | 
[**matchJoinMatchIdPut**](MatchApi.md#matchjoinmatchidput) | **PUT** /Match/join/{matchId} | 
[**matchLeavePut**](MatchApi.md#matchleaveput) | **PUT** /Match/leave | 
[**matchMatchDetailsByIdGet**](MatchApi.md#matchmatchdetailsbyidget) | **GET** /Match/match-details-by-id | 
[**matchPost**](MatchApi.md#matchpost) | **POST** /Match | 
[**matchRefreshDbJobGet**](MatchApi.md#matchrefreshdbjobget) | **GET** /Match/refresh-db-job | 
[**matchUpdateByIdPut**](MatchApi.md#matchupdatebyidput) | **PUT** /Match/update-by-id | 


# **matchActiveByCityGet**
> List<GameDetailsDTO> matchActiveByCityGet(cityId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final cityId = 56; // int | 

try {
    final result = api_instance.matchActiveByCityGet(cityId);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchActiveByCityGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 

### Return type

[**List<GameDetailsDTO>**](GameDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchActiveByCityPaginatedGet**
> GameDetailsDTOPaginatedResponse matchActiveByCityPaginatedGet(cityId, pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final cityId = 56; // int | 
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchActiveByCityPaginatedGet(cityId, pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchActiveByCityPaginatedGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cityId** | **int**|  | [optional] 
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchActiveByFieldGet**
> List<GameDetailsDTO> matchActiveByFieldGet(fieldId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final fieldId = 56; // int | 

try {
    final result = api_instance.matchActiveByFieldGet(fieldId);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchActiveByFieldGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fieldId** | **int**|  | [optional] 

### Return type

[**List<GameDetailsDTO>**](GameDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchActiveByPlayerGet**
> GameDetailsDTOPaginatedResponse matchActiveByPlayerGet(pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchActiveByPlayerGet(pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchActiveByPlayerGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchActiveGet**
> List<GameDetailsDTO> matchActiveGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();

try {
    final result = api_instance.matchActiveGet();
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchActiveGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<GameDetailsDTO>**](GameDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchByFiltersGet**
> GameDetailsDTOPaginatedResponse matchByFiltersGet(organizerId, fieldId, countryId, cityId, startDateFrom, startDateTo, endDateFrom, endDateTo, minPlayersRequired, maxPlayersRequired, playerCanJoin, finished, cancelled, minSpotsAvailable, maxSpotsAvailable, pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final organizerId = 56; // int | 
final fieldId = 56; // int | 
final countryId = 56; // int | 
final cityId = 56; // int | 
final startDateFrom = 2013-10-20T19:20:30+01:00; // DateTime | 
final startDateTo = 2013-10-20T19:20:30+01:00; // DateTime | 
final endDateFrom = 2013-10-20T19:20:30+01:00; // DateTime | 
final endDateTo = 2013-10-20T19:20:30+01:00; // DateTime | 
final minPlayersRequired = 56; // int | 
final maxPlayersRequired = 56; // int | 
final playerCanJoin = true; // bool | 
final finished = true; // bool | 
final cancelled = true; // bool | 
final minSpotsAvailable = 56; // int | 
final maxSpotsAvailable = 56; // int | 
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchByFiltersGet(organizerId, fieldId, countryId, cityId, startDateFrom, startDateTo, endDateFrom, endDateTo, minPlayersRequired, maxPlayersRequired, playerCanJoin, finished, cancelled, minSpotsAvailable, maxSpotsAvailable, pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchByFiltersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organizerId** | **int**|  | [optional] 
 **fieldId** | **int**|  | [optional] 
 **countryId** | **int**|  | [optional] 
 **cityId** | **int**|  | [optional] 
 **startDateFrom** | **DateTime**|  | [optional] 
 **startDateTo** | **DateTime**|  | [optional] 
 **endDateFrom** | **DateTime**|  | [optional] 
 **endDateTo** | **DateTime**|  | [optional] 
 **minPlayersRequired** | **int**|  | [optional] 
 **maxPlayersRequired** | **int**|  | [optional] 
 **playerCanJoin** | **bool**|  | [optional] 
 **finished** | **bool**|  | [optional] 
 **cancelled** | **bool**|  | [optional] 
 **minSpotsAvailable** | **int**|  | [optional] 
 **maxSpotsAvailable** | **int**|  | [optional] 
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchByIdGet**
> MatchDTO matchByIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final id = 56; // int | 

try {
    final result = api_instance.matchByIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchByIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**MatchDTO**](MatchDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchByPlayerGet**
> List<GameDetailsDTO> matchByPlayerGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();

try {
    final result = api_instance.matchByPlayerGet();
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchByPlayerGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**List<GameDetailsDTO>**](GameDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchCancelPut**
> matchCancelPut(matchId, cancelationReason)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final matchId = 56; // int | 
final cancelationReason = cancelationReason_example; // String | 

try {
    api_instance.matchCancelPut(matchId, cancelationReason);
} catch (e) {
    print('Exception when calling MatchApi->matchCancelPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**|  | [optional] 
 **cancelationReason** | **String**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGet**
> MatchDTO matchGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();

try {
    final result = api_instance.matchGet();
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MatchDTO**](MatchDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllActiveByGameTypePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllActiveByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 
final nrOfPlayers = 56; // int | 

try {
    final result = api_instance.matchGetAllActiveByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllActiveByGameTypePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **nrOfPlayers** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllActiveByStartTimePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllActiveByStartTimePaginatorGet(pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchGetAllActiveByStartTimePaginatorGet(pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllActiveByStartTimePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllByGameTypePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 
final nrOfPlayers = 56; // int | 

try {
    final result = api_instance.matchGetAllByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllByGameTypePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **nrOfPlayers** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllByStartTimePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllByStartTimePaginatorGet(pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchGetAllByStartTimePaginatorGet(pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllByStartTimePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllJoinableByGameTypePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllJoinableByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 
final nrOfPlayers = 56; // int | 

try {
    final result = api_instance.matchGetAllJoinableByGameTypePaginatorGet(pageNumber, pageSize, nrOfPlayers);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllJoinableByGameTypePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **nrOfPlayers** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchGetAllJoinableByStartTimePaginatorGet**
> GameDetailsDTOPaginatedResponse matchGetAllJoinableByStartTimePaginatorGet(pageNumber, pageSize)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final pageNumber = 56; // int | 
final pageSize = 56; // int | 

try {
    final result = api_instance.matchGetAllJoinableByStartTimePaginatorGet(pageNumber, pageSize);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchGetAllJoinableByStartTimePaginatorGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageNumber** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 

### Return type

[**GameDetailsDTOPaginatedResponse**](GameDetailsDTOPaginatedResponse.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchIdDelete**
> matchIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final id = 56; // int | 

try {
    api_instance.matchIdDelete(id);
} catch (e) {
    print('Exception when calling MatchApi->matchIdDelete: $e\n');
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

# **matchJoinMatchIdPut**
> matchJoinMatchIdPut(matchId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final matchId = 56; // int | 

try {
    api_instance.matchJoinMatchIdPut(matchId);
} catch (e) {
    print('Exception when calling MatchApi->matchJoinMatchIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**|  | 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchLeavePut**
> matchLeavePut(matchId)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final matchId = 56; // int | 

try {
    api_instance.matchLeavePut(matchId);
} catch (e) {
    print('Exception when calling MatchApi->matchLeavePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchMatchDetailsByIdGet**
> GameDetailsDTO matchMatchDetailsByIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final id = 56; // int | 

try {
    final result = api_instance.matchMatchDetailsByIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchMatchDetailsByIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 

### Return type

[**GameDetailsDTO**](GameDetailsDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchPost**
> matchPost(createMatchDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final createMatchDTO = CreateMatchDTO(); // CreateMatchDTO | 

try {
    api_instance.matchPost(createMatchDTO);
} catch (e) {
    print('Exception when calling MatchApi->matchPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMatchDTO** | [**CreateMatchDTO**](CreateMatchDTO.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchRefreshDbJobGet**
> matchRefreshDbJobGet()



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();

try {
    api_instance.matchRefreshDbJobGet();
} catch (e) {
    print('Exception when calling MatchApi->matchRefreshDbJobGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **matchUpdateByIdPut**
> MatchDTO matchUpdateByIdPut(id, updateMatchDTO)



### Example
```dart
import 'package:openapi/api.dart';
// TODO Configure HTTP Bearer authorization: Bearer
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('Bearer').setAccessToken(yourTokenGeneratorFunction);

final api_instance = MatchApi();
final id = 56; // int | 
final updateMatchDTO = UpdateMatchDTO(); // UpdateMatchDTO | 

try {
    final result = api_instance.matchUpdateByIdPut(id, updateMatchDTO);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->matchUpdateByIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | [optional] 
 **updateMatchDTO** | [**UpdateMatchDTO**](UpdateMatchDTO.md)|  | [optional] 

### Return type

[**MatchDTO**](MatchDTO.md)

### Authorization

[Bearer](../README.md#Bearer)

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

