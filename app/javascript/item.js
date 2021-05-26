function calculationFee(){
  // console.log("イベント発火");
  // 要素の取得
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

// 計算内容と当てはめ
  itemPrice.addEventListener('input', ()=>{
    const inputValue = itemPrice.value;
    const taxFee = Math.floor(inputValue*0.1);
    const profitFee = inputValue-taxFee;
    addTaxPrice.innerHTML = taxFee;
    profit.innerHTML = profitFee;
  });
};


window.addEventListener('load', calculationFee);