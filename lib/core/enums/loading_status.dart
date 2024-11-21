enum LoadingStatus {
  pure,
  loading,
  loadSuccess,
  loadFailure;

  bool get isLoading => this == LoadingStatus.loading;
  bool get hasError => this == LoadingStatus.loadFailure;
}
