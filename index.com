<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Tainá Navalha | Ecobags e Copos Exclusivos</title>
  <style>
    :root {
      --primary-red: #b31217;
      --dark-red: #870b0f;
      --black: #111111;
      --white: #ffffff;
      --off-white: #fcfbfa;
      --gray-light: #f0ebe5;
      --gray-border: #e0dad3;
      --text: #222222;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    body {
      background-color: var(--off-white);
      color: var(--text);
      line-height: 1.6;
    }

    /* Topo promocional/aviso */
    .top-bar {
      background-color: var(--black);
      color: var(--white);
      text-align: center;
      padding: 6px;
      font-size: 0.85rem;
      letter-spacing: 1px;
      text-transform: uppercase;
      font-weight: 600;
    }

    header {
      background-color: var(--white);
      color: var(--black);
      text-align: center;
      padding: 2.5rem 1rem;
      border-bottom: 4px solid var(--primary-red);
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }

    header h1 {
      font-size: 2.5rem;
      letter-spacing: 3px;
      text-transform: uppercase;
      color: var(--primary-red);
      font-weight: 800;
    }

    header p {
      color: var(--black);
      font-size: 1.1rem;
      margin-top: 5px;
      font-weight: 500;
      font-style: italic;
    }

    .container {
      max-width: 1100px;
      margin: 2.5rem auto;
      padding: 0 1rem;
    }

    .grid-produtos {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
      gap: 2rem;
    }

    .card {
      background: var(--white);
      border-radius: 12px;
      overflow: hidden;
      box-shadow: 0 4px 15px rgba(179, 18, 23, 0.08);
      display: flex;
      flex-direction: column;
      border: 1px solid var(--gray-border);
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
      transform: translateY(-4px);
      box-shadow: 0 6px 20px rgba(179, 18, 23, 0.15);
    }

    .card-img-container {
      background-color: var(--white);
      height: 320px;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      position: relative;
      border-bottom: 1px solid var(--gray-border);
      padding: 1rem;
    }

    .card-img-container.black-bg {
      background-color: var(--black);
    }

    .card-img-container img {
      max-height: 100%;
      max-width: 100%;
      object-fit: contain;
    }

    .card-content {
      padding: 1.5rem;
      display: flex;
      flex-direction: column;
      flex-grow: 1;
    }

    .card-title {
      font-size: 1.3rem;
      color: var(--black);
      margin-bottom: 0.5rem;
      font-weight: 700;
    }

    .card-desc {
      font-size: 0.9rem;
      color: #555;
      margin-bottom: 1rem;
      flex-grow: 1;
    }

    .card-price {
      font-size: 1.5rem;
      font-weight: 800;
      color: var(--primary-red);
      margin-bottom: 1rem;
    }

    .qty-selector {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 1rem;
    }

    .qty-btn {
      width: 34px;
      height: 34px;
      background: var(--gray-light);
      border: 1px solid var(--gray-border);
      font-size: 1.2rem;
      font-weight: bold;
      border-radius: 6px;
      cursor: pointer;
      color: var(--black);
      transition: background 0.2s;
    }

    .qty-btn:hover {
      background: var(--primary-red);
      color: var(--white);
      border-color: var(--primary-red);
    }

    .qty-input {
      width: 45px;
      text-align: center;
      font-size: 1rem;
      font-weight: bold;
      border: 1px solid var(--gray-border);
      border-radius: 6px;
      padding: 5px;
    }

    /* Resumo e Checkout */
    .checkout-box {
      background: var(--white);
      border-radius: 12px;
      padding: 2rem;
      margin-top: 3rem;
      border: 2px solid var(--primary-red);
      box-shadow: 0 4px 20px rgba(0,0,0,0.06);
    }

    .checkout-box h2 {
      color: var(--black);
      margin-bottom: 1.5rem;
      border-bottom: 2px solid var(--gray-border);
      padding-bottom: 0.5rem;
      text-transform: uppercase;
      font-size: 1.4rem;
      letter-spacing: 1px;
    }

    .frete-section {
      display: flex;
      gap: 10px;
      margin-bottom: 1.5rem;
      max-width: 400px;
    }

    .frete-input {
      flex: 1;
      padding: 10px;
      border: 1px solid var(--gray-border);
      border-radius: 6px;
      font-size: 1rem;
    }

    .frete-btn {
      background: var(--black);
      color: var(--white);
      border: none;
      padding: 0 20px;
      border-radius: 6px;
      cursor: pointer;
      font-weight: bold;
      transition: background 0.2s;
    }

    .frete-btn:hover {
      background: var(--primary-red);
    }

    .frete-options {
      margin-bottom: 1.5rem;
      display: none;
    }

    .frete-option {
      display: flex;
      justify-content: space-between;
      padding: 10px 14px;
      border: 1px solid var(--gray-border);
      border-radius: 6px;
      margin-top: 8px;
      cursor: pointer;
      background: var(--off-white);
    }

    .summary-details {
      font-size: 1.1rem;
      margin-bottom: 1.5rem;
    }

    .summary-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 8px;
    }

    .summary-row.total {
      font-size: 1.5rem;
      font-weight: bold;
      color: var(--primary-red);
      border-top: 2px dashed var(--gray-border);
      padding-top: 12px;
      margin-top: 10px;
    }

    .btn-pay {
      width: 100%;
      background: #009ee3; /* Azul Oficial do Mercado Pago */
      color: var(--white);
      border: none;
      padding: 1rem;
      font-size: 1.2rem;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
      text-transform: uppercase;
      letter-spacing: 1px;
      transition: background 0.2s;
      box-shadow: 0 4px 12px rgba(0, 158, 227, 0.3);
    }

    .btn-pay:hover {
      background: #0081b8;
    }

    footer {
      text-align: center;
      padding: 2rem;
      background: var(--black);
      color: var(--white);
      margin-top: 4rem;
      font-size: 0.9rem;
      border-top: 4px solid var(--primary-red);
    }

    footer p {
      opacity: 0.9;
    }
  </style>
</head>
<body>

  <div class="top-bar">
    Enviamos para todo o Brasil • Pagamento Seguro via Mercado Pago
  </div>

  <header>
    <h1>Tainá Navalha</h1>
    <p>Coleção Exclusiva — Malandragem & Boemia</p>
  </header>

  <div class="container">
    <div class="grid-produtos">
      
      <!-- PRODUTO 1: Ecobag Cru -->
      <div class="card">
        <div class="card-img-container">
          <img src="1000667703.png" alt="Ecobag Algodão Cru - Arcos da Lapa" />
        </div>
        <div class="card-content">
          <h3 class="card-title">Ecobag Arcos da Lapa (Algodão Cru)</h3>
          <p class="card-desc">100% Algodão Cru de alta gramatura. Arte exclusiva dos Arcos da Lapa impressa em altíssima definição.</p>
          <div class="card-price">R$ 45,00</div>
          <div class="qty-selector">
            <button class="qty-btn" onclick="updateQty('p1', -1)">-</button>
            <input type="number" id="qty-p1" class="qty-input" value="0" readonly />
            <button class="qty-btn" onclick="updateQty('p1', 1)">+</button>
          </div>
        </div>
      </div>

      <!-- PRODUTO 2: Ecobag Preta -->
      <div class="card">
        <div class="card-img-container black-bg">
          <img src="1000667703.png" alt="Ecobag Preta - Arcos da Lapa" />
        </div>
        <div class="card-content">
          <h3 class="card-title">Ecobag Arcos da Lapa (Preta)</h3>
          <p class="card-desc">Tecido de algodão reforçado na cor preta com estampa em alto contraste. Estilo e resistência para o dia a dia.</p>
          <div class="card-price">R$ 49,00</div>
          <div class="qty-selector">
            <button class="qty-btn" onclick="updateQty('p2', -1)">-</button>
            <input type="number" id="qty-p2" class="qty-input" value="0" readonly />
            <button class="qty-btn" onclick="updateQty('p2', 1)">+</button>
          </div>
        </div>
      </div>

      <!-- PRODUTO 3: Copo Americano -->
      <div class="card">
        <div class="card-img-container">
          <img src="1000664877.png" alt="Copo Americano - Salve a Malandragem" />
        </div>
        <div class="card-content">
          <h3 class="card-title">Copo Americano - Salve a Malandragem</h3>
          <p class="card-desc">O autêntico copo de botequim estampado com a carta de Zé Pelintra. Ideal para colecionar e presentear.</p>
          <div class="card-price">R$ 25,00</div>
          <div class="qty-selector">
            <button class="qty-btn" onclick="updateQty('p3', -1)">-</button>
            <input type="number" id="qty-p3" class="qty-input" value="0" readonly />
            <button class="qty-btn" onclick="updateQty('p3', 1)">+</button>
          </div>
        </div>
      </div>

    </div>

    <!-- RESUMO E CHECKOUT -->
    <div class="checkout-box">
      <h2>Resumo da Compra</h2>
      
      <!-- Cálculo de CEP -->
      <label style="font-weight: 600; display: block; margin-bottom: 5px;">Calcular Frete (Melhor Envio):</label>
      <div class="frete-section">
        <input type="text" id="cep-input" class="frete-input" placeholder="Digite seu CEP (ex: 20021-000)" maxlength="9" />
        <button class="frete-btn" onclick="simularFrete()">Calcular</button>
      </div>

      <!-- Opções Simuladas de Frete -->
      <div id="frete-options" class="frete-options">
        <p style="font-size:0.9rem; color:#555; font-weight:600;">Opções de Envio Disponíveis:</p>
        <label class="frete-option">
          <span><input type="radio" name="frete" value="18.50" onchange="updateTotals()" checked /> Correios PAC (3 a 5 dias)</span>
          <strong>R$ 18,50</strong>
        </label>
        <label class="frete-option">
          <span><input type="radio" name="frete" value="27.00" onchange="updateTotals()" /> Correios Sedex (1 a 2 dias)</span>
          <strong>R$ 27,00</strong>
        </label>
      </div>

      <!-- Detalhes do Valor -->
      <div class="summary-details">
        <div class="summary-row">
          <span>Subtotal dos Produtos:</span>
          <span id="subtotal-val">R$ 0,00</span>
        </div>
        <div class="summary-row">
          <span>Frete:</span>
          <span id="frete-val">R$ 0,00</span>
        </div>
        <div class="summary-row total">
          <span>Valor Total:</span>
          <span id="total-val">R$ 0,00</span>
        </div>
      </div>

      <button class="btn-pay" onclick="simularCheckout()">Pagar com Mercado Pago</button>
    </div>
  </div>

  <footer>
    <p>© 2026 Tainá Navalha — Todos os direitos reservados.</p>
  </footer>

  <script>
    const prices = { p1: 45.00, p2: 49.00, p3: 25.00 };
    const quantities = { p1: 0, p2: 0, p3: 0 };
    let freteValue = 0;

    function updateQty(id, delta) {
      quantities[id] = Math.max(0, quantities[id] + delta);
      document.getElementById(`qty-${id}`).value = quantities[id];
      updateTotals();
    }

    function simularFrete() {
      const cep = document.getElementById('cep-input').value;
      if (!cep) {
        alert('Por favor, digite um CEP válido.');
        return;
      }
      document.getElementById('frete-options').style.display = 'block';
      updateTotals();
    }

    function updateTotals() {
      const subtotal = (quantities.p1 * prices.p1) + 
                       (quantities.p2 * prices.p2) + 
                       (quantities.p3 * prices.p3);

      const freteRadios = document.getElementsByName('frete');
      const freteBoxVisible = document.getElementById('frete-options').style.display === 'block';
      
      freteValue = 0;
      if (freteBoxVisible) {
        for (const radio of freteRadios) {
          if (radio.checked) {
            freteValue = parseFloat(radio.value);
            break;
          }
        }
      }

      const total = subtotal + (subtotal > 0 ? freteValue : 0);

      document.getElementById('subtotal-val').innerText = `R$ ${subtotal.toFixed(2).replace('.', ',')}`;
      document.getElementById('frete-val').innerText = freteBoxVisible && subtotal > 0 ? `R$ ${freteValue.toFixed(2).replace('.', ',')}` : 'R$ 0,00';
      document.getElementById('total-val').innerText = `R$ ${total.toFixed(2).replace('.', ',')}`;
    }

    function simularCheckout() {
      const totalItems = quantities.p1 + quantities.p2 + quantities.p3;
      if (totalItems === 0) {
        alert('Selecione ao menos um produto antes de ir para o pagamento!');
        return;
      }
      alert('Protótipo interativo! Na versão final, este botão redirecionará o cliente para o checkout do Mercado Pago.');
    }
  </script>
</body>
</html>
