function increaseQuantity(quantityId) {
    var quantityElement=document.getElementById(quantityId);
    var currentQuantity=parseInt(quantityElement.textContent);
    quantityElement.textContent=currentQuantity+1;
    updateTotal();
}

function decreaseQuantity(quantityId) {
    var quantityElement=document.getElementById(quantityId);
    var currentQuantity=parseInt(quantityElement.textContent);

    if (currentQuantity > 1) {
        quantityElement.textContent=currentQuantity - 1;
        updateTotal();
    }
}

function updateTotal() {}

const add = document.getElementsByClassName('addBtn')
const remove = document.getElementsByClassName('removeBtn')

const addFn = (e)=>{
  e.target.parentNode.querySelector('input').value ++
}
const removeFn = (e)=>{
  e.target.parentNode.querySelector('input').value --
}
for(let i=0;i<add.length;i++){
  add[i].addEventListener('click', addFn)
}
for(let i=0;i<remove.length;i++){
  remove[i].addEventListener('click', removeFn)
}