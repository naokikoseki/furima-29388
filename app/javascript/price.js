function priceCalc() {
  const priceInput = document.getElementById("item-price");
  const addTax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
   priceInput.addEventListener('keyup',() =>{
     const price = priceInput.value;
     const tax = 0.1 ;
     if (price >= 300 && price <= 9999999){
       let fee = price * tax;
       let benefit = price - fee;
       addTax.textContent = fee;
       profit.textContent = benefit;}
      else{
        let fee = "--";
        let benefit = "--";
        addTax.textContent = fee;
        profit.textContent = benefit;}
    });
}
  window.addEventListener('load',priceCalc)