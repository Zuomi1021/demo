const photos = document.getElementsByClassName('photos');
const mainPhoto = document.getElementById('mainPhoto');

const toggleMainImgFn = (e)=>{
    mainPhoto.src = e.target.src 
}

for(let i=0;i<photos.length;i++){
    photos[i].addEventListener('click', toggleMainImgFn);
}