const taxRatio = 0.1
const profitRatio = 0.9

function tax (){
  const itemPrice  = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.round(itemPrice.value*taxRatio);
    const profit  = document.getElementById("profit");
    profit.innerHTML = Math.round(itemPrice.value*profitRatio);
  });
}

window.addEventListener('load', tax);