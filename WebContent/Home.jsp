<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Inventário</title>
  <style>
    /* reset básico */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, sans-serif;
      color: #333;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }

    /* Topbar */
    header {
      background-color: #2c3e50;
      height: 60px;
      display: flex;
      align-items: center;
      padding: 0 1.5rem;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }
    header a {
      color: #ecf0f1;
      text-decoration: none;
      font-weight: bold;
      margin-right: 1.2rem;
      transition: color 0.2s;
    }
    header a:hover {
      color: #bdc3c7;
    }

    /* Área principal */
    main {
      flex: 1;
      background-color: #f0f8ff;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .cards-container {
      display: flex;
      gap: 2rem;
      flex-wrap: wrap;
    }
    .card {
      width: 200px;
      height: 120px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      display: flex;
      justify-content: center;
      align-items: center;
      text-decoration: none;
      color: #2c3e50;
      font-size: 1.1em;
      font-weight: 500;
      transition: transform 0.2s, box-shadow 0.2s;
    }
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
  </style>
</head>
<body>
  <header>
    <a href="/inventario/home">Home</a>
    <a href="/inventario/creditos.html">Créditos</a>
  </header>

  <main>
    <div class="cards-container">
      <a class="card" href="/inventario/clientes">Clientes</a>
      <a class="card" href="/inventario/vendedores">Vendedores</a>
      <a class="card" href="/inventario/ordensVenda">Ordens de Venda</a>
    </div>
  </main>
</body>
</html>
