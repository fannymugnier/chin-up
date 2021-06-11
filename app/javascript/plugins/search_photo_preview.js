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
      if (input1.value.length >= 3) {
        if (input1.value === "Deux Tours" || input1.value === "Deux tours" || input1.value === "deux tours" ) {
          updateImage1("https://fr.web.img6.acsta.net/medias/nmedia/00/02/54/95/affiche2.jpg")
        } else if (input1.value === "oui") {
          updateImage1("https://images.unsplash.com/photo-1580893211123-627e0262be3a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80")
        } else {
          fetchPhoto(input1.value, updateImage1);
        }
      }
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
      if (input2.value.length >= 3) {
        if (input2.value === "Retour du Roi" || input2.value === "Retour du roi" || input2.value === "retour du roi") {
          updateImage2("https://fr.web.img3.acsta.net/medias/nmedia/18/35/14/33/18366630.jpg")
        } else if (input2.value === "non") {
          updateImage2("https://www.publicdomainpictures.net/pictures/180000/velka/hand-with-thumb-down.jpg")
        } else {
          fetchPhoto(input2.value, updateImage2);
        }
      }
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
