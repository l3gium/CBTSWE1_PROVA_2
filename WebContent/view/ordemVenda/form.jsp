<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Inventário – Ordens de Venda</title>
  <style>
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
  <header>
    <a href="/inventario/home">Home</a>
    <a href="/inventario/creditos.html">Créditos</a>
  </header>

  <main>
    <div class="form-container">
      <h1>Ordens de Venda</h1>
      <c:choose>
        <c:when test="${ordemVenda != null}">
          <form action="update" method="post">
        </c:when>
        <c:otherwise>
          <form action="insert" method="post">
        </c:otherwise>
      </c:choose>

        <div class="form-group">
          <input type="hidden" id="ordNo" name="ordNo"
                 value="<c:out value='${ordemVenda.getOrdNo()}'/>" />
        </div>

        <div class="form-group">
          <label for="purchAmt">Valor da Compra:</label>
          <input type="text" id="purchAmt" name="purchAmt"
                 value="<c:out value='${ordemVenda.getPurchAmt()}'/>" />
        </div>

        <div class="form-group">
          <label for="ordDate">Data da Ordem:</label>
          <input type="text" id="ordDate" name="ordDate"
                 value="<fmt:formatDate value='${ordemVenda.getOrdDate()}' pattern='dd/MM/yyyy'/>" />
        </div>

        <div class="form-group">
          <label for="customerId">Cliente:</label>
          <select id="customerId" name="customerId">
            <option value="">-- selecione --</option>
            <c:forEach var="c" items="${clientesList}">
              <option value="${c.customerId}"
                <c:if test="${ordemVenda != null and c.customerId == ordemVenda.customerId}">
                  selected
                </c:if>
              >${c.custName} (${c.customerId})</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <label for="salesmanId">Vendedor:</label>
          <select id="salesmanId" name="salesmanId">
            <option value="">-- selecione --</option>
            <c:forEach var="v" items="${vendedoresList}">
              <option value="${v.salesmanId}"
                <c:if test="${ordemVenda != null and v.salesmanId == ordemVenda.salesmanId}">
                  selected
                </c:if>
              >${v.name} (${v.salesmanId})</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-actions">
          <a href="/inventario/ordensVenda" class="button cancel">Cancelar</a>
          <button type="submit" class="button submit">Salvar</button>
        </div>
      </form>
    </div>
  </main>
</body>
</html>
