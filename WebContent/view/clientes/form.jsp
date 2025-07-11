<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Inventário – Clientes</title>
  <style>
    /* reset básico */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, sans-serif;
      background-color: #f0f8ff;
      color: #333;
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
      margin-right: 1rem;
      transition: color 0.2s;
    }
    header a:hover {
      color: #bdc3c7;
    }

    /* Conteúdo principal */
    main {
      flex: 1;
      padding: 2rem;
      display: flex;
      justify-content: center;
      align-items: start;
    }
    .form-container {
      background-color: #fff;
      padding: 2rem;
      border-radius: 8px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      width: 400px;
    }

    .form-container h1 {
      margin-bottom: 1.5rem;
      font-size: 1.8em;
      color: #2c3e50;
      text-align: center;
    }

    .form-group {
      margin-bottom: 1rem;
    }
    .form-group label {
      display: block;
      margin-bottom: 0.3rem;
      font-weight: 500;
    }
    .form-group input,
    .form-group select {
      width: 100%;
      padding: 0.5rem;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 1em;
      background-color: #fff;
    }
    .form-group input:focus,
    .form-group select:focus {
      outline: none;
      border-color: #3498db;
      box-shadow: 0 0 3px rgba(52,152,219,0.3);
    }

    .form-actions {
      display: flex;
      justify-content: flex-end;
      gap: 1rem;
      margin-top: 1.5rem;
    }
    .button {
      padding: 0.6rem 1rem;
      border: none;
      border-radius: 4px;
      font-weight: 500;
      text-decoration: none;
      text-align: center;
      cursor: pointer;
      transition: background-color 0.2s;
    }
    .button.cancel {
      background-color: #bdc3c7;
      color: #2c3e50;
    }
    .button.cancel:hover {
      background-color: #95a5a6;
    }
    .button.submit {
      background-color: #3498db;
      color: #fff;
    }
    .button.submit:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>
  <!-- Topbar com Home e Créditos -->
  <header>
    <a href="/inventario/home">Home</a>
    <a href="/inventario/creditos.html">Créditos</a>
  </header>

  <!-- Formulário de inserção/edição de Cliente -->
  <main>
    <div class="form-container">
      <h1>Clientes</h1>

      <c:choose>
        <c:when test="${cliente != null}">
          <form action="update" method="post">
        </c:when>
        <c:otherwise>
          <form action="insert" method="post">
        </c:otherwise>
      </c:choose>

        <input type="hidden" id="id" name="id"
               value="<c:out value='${cliente.customerId}'/>" />

        <div class="form-group">
          <label for="nome">Nome do Cliente:</label>
          <input type="text" id="nome" name="nome"
                 value="<c:out value='${cliente.custName}'/>" />
        </div>

        <div class="form-group">
          <label for="cidade">Cidade:</label>
          <input type="text" id="cidade" name="cidade"
                 value="<c:out value='${cliente.city}'/>" />
        </div>

        <div class="form-group">
          <label for="classificacao">Classificação:</label>
          <input type="text" id="classificacao" name="classificacao"
                 value="<c:out value='${cliente.grade}'/>" />
        </div>
        
        <div class="form-group">
          <label for="salesmanId">Vendedor:</label>
          <select id="salesmanId" name="salesmanId">
            <option value="">-- selecione --</option>
            <c:forEach var="v" items="${vendedoresList}">
              <option value="${v.salesmanId}">${v.name} (${v.salesmanId})</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-actions">
          <a href="/inventario/clientes" class="button cancel">Cancelar</a>
          <button type="submit" class="button submit">Salvar</button>
        </div>
      </form>
    </div>
  </main>
</body>
</html>
