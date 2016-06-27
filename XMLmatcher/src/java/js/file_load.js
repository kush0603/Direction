function onFileSelectedChange(event) {
  alert("hello");
  var selectedFile = event.target.files[0];
  var reader = new FileReader();

  var result = document.getElementById("file1");

  reader.onload = function(event) {
    result.innerHTML = event.target.result;
  };

  reader.readAsText(selectedFile);
}
