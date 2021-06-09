// Image and input 1
const updateImage1 = (url) => {
  document.getElementById("photo-preview1").src = url;
  document.getElementById("url-input1").value = url;
  document.getElementById("photo-preview1").classList.remove("hidden");
}

const previewImageOnQuery1 = () => {
  const input1 = document.querySelector("#input1");
  if (input1) {
    input1.addEventListener("input", () => {
      if (input1.value.length > 3)
        fetchPhoto(input1.value, updateImage1);
    });
  }
};

// Image and input 2
const updateImage2 = (url) => {
  document.getElementById("photo-preview2").src = url;
  document.getElementById("url-input2").value = url;
  document.getElementById("photo-preview2").classList.remove("hidden");
}

const previewImageOnQuery2 = () => {
  const input2 = document.querySelector("#input2");
  if (input2) {
    input2.addEventListener("input", () => {
      if (input2.value.length > 3)
        fetchPhoto(input2.value, updateImage2);
    });
  }
};


const fetchPhoto = (query, callback) => {
  fetch(
    `https://api.unsplash.com/search/photos/?client_id=Owi0WKWHFvpCLeFrDoxk8bfEKBE1ycleGQDX_mgabg0&query=${query}`
    )
    .then((response) => response.json())
    .then((data) => {
      if (data.results.length > 0) {
        console.log(data.results[0].urls.small);
        callback(data.results[0].urls.small);
      }
    });
  };

  export { previewImageOnQuery1, previewImageOnQuery2 }