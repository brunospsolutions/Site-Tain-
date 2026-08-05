// api/checkout.js
export default async function handler(req, res) {
  if (req.method !== 'POST') {
    return res.status(405).json({ message: 'Método não permitido' });
  }

  const { items, shippingValue } = req.body;

  try {
    const response = await fetch('https://api.mercadopago.com/checkout/preferences', {
      method: 'POST',
      headers: {
        'Authorization': `Bearer ${process.env.MERCADO_PAGO_TOKEN}`,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        items: items,
        shipments: {
          cost: Number(shippingValue) || 0,
          mode: 'not_specified'
        },
        back_urls: {
          success: 'https://seu-dominio.com/sucesso',
          failure: 'https://seu-dominio.com/erro',
          pending: 'https://seu-dominio.com/pendente'
        },
        auto_return: 'approved'
      })
    });

    const data = await response.json();

    if (data.init_point) {
      return res.status(200).json({ url: data.init_point });
    } else {
      return res.status(400).json({ message: 'Erro ao gerar preferência de pagamento', error: data });
    }
  } catch (error) {
    return res.status(500).json({ message: 'Erro interno no servidor', error: error.message });
  }
}
