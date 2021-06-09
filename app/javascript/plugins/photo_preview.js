const previewImageOnFileSelect1 = () => {
  // we select the photo input
  const input = document.getElementById("photo-input1");
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener("change", () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview(input);
    });
  }
};

const displayPreview = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById("photo-preview1").src = event.currentTarget.result;
    };
    reader.readAsDataURL(input.files[0]);
    document.getElementById("photo-preview1").classList.remove("hidden");
  }
};

const previewImageOnFileSelect2 = () => {
  // we select the photo input
  const input = document.getElementById("photo-input2");
  if (input) {
    // we add a listener to know when a new picture is uploaded
    input.addEventListener("change", () => {
      // we call the displayPreview function (who retrieve the image url and display it)
      displayPreview2(input);
    });
  }
};

const displayPreview2 = (input) => {
  if (input.files && input.files[0]) {
    const reader = new FileReader();
    reader.onload = (event) => {
      document.getElementById("photo-preview2").src = event.currentTarget.result;
    };
    reader.readAsDataURL(input.files[0]);
    document.getElementById("photo-preview2").classList.remove("hidden");
  }
};

export { previewImageOnFileSelect1 };
export { previewImageOnFileSelect2 };
