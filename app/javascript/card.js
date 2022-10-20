const pay = () => {
  // フォーム送信時にイベント発火
  //Payjp.setPublicKey("pk_test_f581d69bb4beebc11323f164");
   Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    // フォームの情報を取得
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_form[number]"),
      exp_month: formData.get("order_form[exp_month]"),
      exp_year: `20${formData.get("order_form[exp_year]")}`,
      cvc: formData.get("order_form[cvc]"),
    };
//debugger
    // カードの情報をトークン化
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      // クレジットカードの情報を削除
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      // フォームの情報をサーバーサイドに送信
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
