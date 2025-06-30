package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import daos.ClientesDAO;
import daos.OrdemVendaDAO;
import daos.VendedorDAO;
import models.Cliente;
import models.OrdemVenda;
import models.Vendedor;

//Desenvolvido por Beatriz Bastos Borges e Miguel Luizatto Alves

@WebServlet(name = "OrdemVendaControllerServlet", urlPatterns = {"/ordensVenda/*"}, loadOnStartup = 1)
public class OrdemVendaControllerServlet extends HttpServlet 
{
	private OrdemVendaDAO   _ordemVendaDAO;
    private ClientesDAO     _clientesDAO;
    private VendedorDAO     _vendedoresDAO;
	
    private static final long serialVersionUID = 1L;
    
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
 
        this._ordemVendaDAO = new OrdemVendaDAO(jdbcURL, jdbcUsername, jdbcPassword);
        this._clientesDAO = new ClientesDAO(jdbcURL, jdbcUsername, jdbcPassword);
        this._vendedoresDAO = new VendedorDAO(jdbcURL, jdbcUsername, jdbcPassword);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        doGet(request, response);
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
    	String action = request.getPathInfo();

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
    	catch (ParseException ex) 
    	{
            throw new ServletException(ex);
        }
    }
 
    private void list(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException 
    {
        List<OrdemVenda> list = _ordemVendaDAO.listAll();
        request.setAttribute("list", list);
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/view/ordemVenda/list.jsp");
        dispatcher.forward(request, response);
    }
 
    protected void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException 
    {
    	
        List<Cliente> clientesList = _clientesDAO.listAll();
        List<Vendedor> vendedoresList = _vendedoresDAO.listAll();
        
        request.setAttribute("clientesList",   clientesList);
        request.setAttribute("vendedoresList", vendedoresList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/ordemVenda/form.jsp");
        dispatcher.forward(request, response);
    }
 
    protected void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException 
    {
        int id = Integer.parseInt(request.getParameter("id"));
        OrdemVenda ordemVenda = _ordemVendaDAO.getById(id);

        List<Cliente>   clientesList   = _clientesDAO.listAll();
        List<Vendedor>  vendedoresList = _vendedoresDAO.listAll();
        request.setAttribute("clientesList",   clientesList);
        request.setAttribute("vendedoresList", vendedoresList);

        request.setAttribute("ordemVenda", ordemVenda);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/ordemVenda/form.jsp");
        dispatcher.forward(request, response);
    }
 
    private void insert(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ParseException 
    {  
    	 double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
    	 String ordDateStr = request.getParameter("ordDate");
    	 SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    	 Date ordDate = dateFormat.parse(ordDateStr);
         int customerId = Integer.parseInt(request.getParameter("customerId"));
         int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
         
         OrdemVenda entity = new OrdemVenda(purchAmt, ordDate, customerId, salesmanId);
        _ordemVendaDAO.insert(entity);
        response.sendRedirect("list");
    }
 
    private void update(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ParseException 
    {
    	 int id = Integer.parseInt(request.getParameter("ordNo")); 
    	 double purchAmt = Double.parseDouble(request.getParameter("purchAmt"));
    	 String ordDateStr = request.getParameter("ordDate");
    	 SimpleDateFormat inputFormat = new SimpleDateFormat("dd/MM/yyyy");
    	 Date ordDate = inputFormat.parse(ordDateStr);
         int customerId = Integer.parseInt(request.getParameter("customerId"));
         int salesmanId = Integer.parseInt(request.getParameter("salesmanId"));
         
         OrdemVenda entity = new OrdemVenda(id, purchAmt, ordDate, customerId, salesmanId);
         _ordemVendaDAO.update(entity);
         response.sendRedirect("list");
    }
 
    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException 
    {
        int id = Integer.parseInt(request.getParameter("id"));
 
        OrdemVenda entity = new OrdemVenda(id);
        _ordemVendaDAO.delete(entity);
        
        response.sendRedirect("list");
    }

}
