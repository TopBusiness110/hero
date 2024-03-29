part of 'upload_documents_cubit.dart';


abstract class UploadDocumentsStates {}

class DriverSignUpInitial extends UploadDocumentsStates {}

class LoadingGEtCitiesState extends UploadDocumentsStates {}
class FailureGEtCitiesState extends UploadDocumentsStates {}
class SuccessGEtCitiesState extends UploadDocumentsStates {}
class LoadingStoreDriverDataState extends UploadDocumentsStates {}
class FailureStoreDriverDataState extends UploadDocumentsStates {}
class SuccessStoreDriverDataState extends UploadDocumentsStates {}
class LoadingStoreBikeDataState extends UploadDocumentsStates {}
class FailureStoreBikeDataState extends UploadDocumentsStates {}
class SuccessStoreBikeDataState extends UploadDocumentsStates {}
class LoadingUpdateBikeDataState extends UploadDocumentsStates {}
class FailureUpdateBikeDataState extends UploadDocumentsStates {}
class SuccessUpdateBikeDataState extends UploadDocumentsStates {}
class ChangeCityState extends UploadDocumentsStates {}
class ChangeAreaState extends UploadDocumentsStates {}
class ChangeCurrentCityIdState extends UploadDocumentsStates {}
class LoadingGEtDriverDataState extends UploadDocumentsStates {}
class FailureGEtDriverDataState extends UploadDocumentsStates {}
class SuccessGEtDriverDataState extends UploadDocumentsStates {}



class ImagePickedSuccessfully extends UploadDocumentsStates {}
class ImageNotPicked extends UploadDocumentsStates {}