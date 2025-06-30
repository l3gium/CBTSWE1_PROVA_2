<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Inventário – Vendedores</title>
  <style>
    /* Reset básico */
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
      overflow-y: auto;
    }
    .content-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
    }
    .content-header h1 {
      font-size: 1.8em;
      color: #2c3e50;
    }
    .button {
      display: inline-block;
      padding: 0.6rem 1rem;
      background-color: #3498db;
      color: #fff;
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.2s;
    }
    .button:hover {
      background-color: #2980b9;
    }
    /* Tabela de vendedores */
    table {
      width: 100%;
      border-collapse: collapse;
      background-color: #fff;
      border-radius: 6px;
      overflow: hidden;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }
    thead {
      background-color: #2c3e50;
      color: #ecf0f1;
    }
    th, td {
      padding: 0.75rem 1rem;
      text-align: left;
    }
    tbody tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    tbody tr:hover {
      background-color: #e9f9ff;
    }
    /* Links de ação */
    .action {
      color: #3498db;
      text-decoration: none;
      margin: 0 0.3rem;
      font-weight: 500;
    }
    .action:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <!-- Topbar -->
  <header>
    <a href="/inventario/home">Home</a>
    <a href="/inventario/creditos.html">Créditos</a>
  </header>

  <!-- Conteúdo principal -->
  <main>
    <div class="content-header">
      <h1>Vendedores</h1>
      <a href="/inventario/vendedores/new" class="button">Novo Vendedor</a>
    </div>

    <table>
      <thead>
        <tr>
          <th>ID do Vendedor</th>
          <th>Nome do Vendedor</th>
          <th>Cidade</th>
          <th>Comissão</th>
          <th colspan="2">Ações</th>
        </tr>
      </thead>
      <tbody>
        <c:if test="${list.size() > 0}">
          <c:forEach var="item" items="${list}">
            <tr>
              <td><c:out value="${item.getSalesmanId()}"/></td>
              <td><c:out value="${item.getName()}"/></td>
              <td><c:out value="${item.getCity()}"/></td>
              <td><c:out value="${item.getCommission()}"/></td>
              <td>
                <a href="/inventario/vendedores/delete?id=<c:out value='${item.getSalesmanId()}'/>"
                   class="action">Remover</a>
              </td>
              <td>
                <a href="/inventario/vendedores/edit?id=<c:out value='${item.getSalesmanId()}'/>"
                   class="action">Editar</a>
              </td>
            </tr>
          </c:forEach>
        </c:if>
        <c:if test="${list.size() <= 0}">
          <tr>
            <td colspan="6" style="text-align: center; padding: 1.5rem;">
              Sem vendedores cadastrados
            </td>
          </tr>
        </c:if>
      </tbody>
    </table>
  </main>
</body>
</html>
