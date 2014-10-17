var clientId = '720409271749-hqv3lb4u0q82t68vperem5oi3kosskol.apps.googleusercontent.com';
var developerKey = 'AIzaSyBTEWsJ4aXdoOzB4ey81eX9-ja7HejL4Qc';
var accessToken;
function onApiLoad() {
  gapi.load('auth', authenticateWithGoogle);
  gapi.load('picker', '1', {"callback": authenticateWithGoogle});
}
function authenticateWithGoogle() {
  window.gapi.auth.authorize({
    'client_id': clientId,
    'scope': ['https://www.googleapis.com/auth/drive']
  }, handleAuthentication);
}
function handleAuthentication(result) {
  if(result && !result.error) {
    accessToken = result.access_token;
    setupPicker();
  }
}
function setupPicker() {
  var picker = new google.picker.PickerBuilder().
    enableFeature(google.picker.Feature.MULTISELECT_ENABLED).
    addView(new google.picker.DocsView().setParent('0B1RaPQwOZ6RDTHBrV2hMNWpXdU0')).
    addView(new google.picker.DocsUploadView().setParent('0B1RaPQwOZ6RDTHBrV2hMNWpXdU0'))

    .setOAuthToken(accessToken)
    .setDeveloperKey(developerKey)
    .setCallback(pickerCallback)
    .build();
  picker.setVisible(true);

}
function pickerCallback(data) {
  var url = 'nothing';
  if (data[google.picker.Response.ACTION] == google.picker.Action.PICKED) {
    var doc = data[google.picker.Response.DOCUMENTS][0];
    url = doc[google.picker.Document.URL];
  }
  var message = 'You picked: ' + url;
  document.getElementById('result').innerHTML = message;
}
