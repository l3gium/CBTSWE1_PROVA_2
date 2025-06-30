package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import daos.*;
import models.*;

//Desenvolvido por Beatriz Bastos Borges e Miguel Luizatto Alves

@WebServlet(name = "ClienteControllerServlet", urlPatterns = {"/clientes/*"}, loadOnStartup = 1)
public class ClienteControllerServlet extends HttpServlet 
{
    private static final long serialVersionUID = 1L;
    private ClientesDAO _clienteDAO;
    private VendedorDAO     _vendedoresDAO;
    
    String host         = "127.0.0.1";                 
    int    port         = 3306;                        
    String schema       = "tp_final";                 
    String jdbcUsername = "root";                      
    String jdbcPassword = "mainthresh";                

    String jdbcURL = String.format(
        "jdbc:mysql://%s:%d/%s?useSSL=false&serverTimezone=UTC",
        host, port, schema
    );
 
    public void init() 
    {
        String jdbcURL = getServletContext().getInitParameter("jdbcURL");
        String jdbcUsername = getServletContext().getInitParameter("jdbcUsername");
        String jdbcPassword = getServletContext().getInitParameter("jdbcPassword");
 
        this._clienteDAO = new ClientesDAO(jdbcURL, jdbcUsername, jdbcPassword);
        this._vendedoresDAO = new VendedorDAO(jdbcURL, jdbcUsername, jdbcPassword);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String action = request.getPathInfo();
    	System.out.println(action);

    	if(action == null) action = ""; 	

    	try 
    	{
            switch (action) 
            {
	            case "/new":
	                showNewForm(request, response);
	                break;
	            case "/insert":
	                insert(request, response);
	                break;
	            case "/delete":
	                delete(request, response);
	                break;
	            case "/edit":
	                showEditForm(request, response);
	                break;
	            case "/update":
	                update(request, response);
	                break;
	            default:
	                list(request, response);
	                break;
            }
        } 
    	catch (SQLException ex) 
    	{
            throw new ServletException(ex);
        }
    }
 
    private void list(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException 
    {
        List<Cliente> list = _clienteDAO.listAll();
        request.setAttribute("list", list);
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/view/clientes/list.jsp");
        dispatcher.forward(request, response);
    }
 
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	try {
			List<Vendedor> vendedoresList = _vendedoresDAO.listAll();
			
	        request.setAttribute("vendedoresList", vendedoresList);
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/clientes/form.jsp");
	        dispatcher.forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
 
    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException 
    {
        int id = Integer.parseInt(request.getParameter("id"));
        Cliente cliente = _clienteDAO.getById(id);
        List<Vendedor> vendedoresList = _vendedoresDAO.listAll();
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/clientes/form.jsp");

        request.setAttribute("cliente", cliente);
        request.setAttribute("vendedoresList", vendedoresList);

        dispatcher.forward(request, response);
    }
 
    private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
    {
        String custName = request.getParameter("nome");
        String city = request.getParameter("cidade");
        int grade = Integer.parseInt(request.getParameter("classificacao"));
        int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
 
        Cliente entity = new Cliente(custName, city, grade, salesmanId);
        _clienteDAO.insert(entity);
        response.sendRedirect("list");
    }
 
    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
    {
         int id = Integer.parseInt(request.getParameter("id")); 
    	 String custName = request.getParameter("nome");
         String city = request.getParameter("cidade");
         int grade = Integer.parseInt(request.getParameter("classificacao"));
         int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
  
         Cliente entity = new Cliente(id, custName, city, grade, salesmanId);
 
         _clienteDAO.update(entity);
         response.sendRedirect("list");
    }
 
    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
    {
        int id = Integer.parseInt(request.getParameter("id"));
 
        Cliente entity = new Cliente(id);
        _clienteDAO.delete(entity);
        
        response.sendRedirect("list");
    }
}
