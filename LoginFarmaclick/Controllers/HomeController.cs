using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LoginFarmaclick.Models;
using System.Text;

namespace LoginFarmaclick.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult IndexConSessionPaciente()
    {
        Paciente usu = Paciente.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Paciente = usu;
        return View();
    }
    public IActionResult IndexConSessionDoctor()
    {
        Doctor usu = Doctor.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Doctor = usu;
        return View();
    }
    public IActionResult IndexConSessionFarmacia()
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Farmacia = usu;
        return View();
    }
    public IActionResult DatosCuentaPaciente()
    {
        Paciente usu = Paciente.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Paciente = usu;
        return View();
    }
    public IActionResult DatosCuentaDoctor()
    {
        Doctor usu = Doctor.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Doctor = usu;
        return View();
    }
    public IActionResult DatosCuentaFarmacia()
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Farmacia = usu;
        return View();
    }
    public IActionResult Stock()
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        List<Producto> Productos = BD.BuscarProductos(usu.IdFarmacia);
        ViewBag.Productos = Productos;
        ViewBag.Farmacia = usu;
        return View();
    }
    public IActionResult EliminarProducto(int IdProducto)
    {
        Farmacia farmacia = Farmacia.FromString(HttpContext.Session.GetString("user"));
        BD.EliminarProducto(IdProducto);
        return RedirectToAction("Stock", "Home");
    }
    public IActionResult EditarProducto(int IdProducto)
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Farmacia = usu;
        ViewBag.Producto = BD.BuscarProducto(IdProducto);
        return View();
    }
    public IActionResult Editar(Producto usu)
    {
        Farmacia farmacia = Farmacia.FromString(HttpContext.Session.GetString("user"));
        BD.EditarProducto(usu, farmacia.IdFarmacia);
        return RedirectToAction("IndexConSessionFarmacia");
    }   
    public IActionResult AgregarProducto()
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Farmacia = usu;
        return View();
    }
    public IActionResult GuardarProducto(Producto usu)
    {
        Farmacia farmacia = Farmacia.FromString(HttpContext.Session.GetString("user"));
        BD.AgregarProducto(usu, farmacia.IdFarmacia);
        return RedirectToAction("Stock");
    }
    [HttpGet]
    public List<Producto> ResultadosBusqueda(string query)
    {
       return BD.Buscar(query);
        
    }
    public IActionResult PedidosPaciente(int page = 1)
    {
        Paciente usu = Paciente.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        List<Pedido> Pedidos = BD.BuscarPedidos(usu.IdPaciente);
        ViewBag.Paciente = usu;

        const int pageSize = 4;

        // Paginar los pedidos
        var pedidosPaginados = Pedidos.Skip((page - 1) * pageSize).Take(pageSize).ToList();
        ViewBag.Pedidos = pedidosPaginados;

        // Calcular el número total de páginas
        var totalPages = (int)Math.Ceiling((double)Pedidos.Count() / pageSize);
        ViewBag.TotalPages = totalPages;
        ViewBag.CurrentPage = page;
        
        return View();
    }
    public IActionResult PedidosFarmacia(int page = 1)
    {
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        List<Pedido> Pedidos = BD.BuscarPedidos(usu.IdFarmacia);
        ViewBag.Farmacia = usu;

        const int pageSize = 4;

        // Paginar los pedidos
        var pedidosPaginados = Pedidos.Skip((page - 1) * pageSize).Take(pageSize).ToList();
        ViewBag.Pedidos = pedidosPaginados;

        // Calcular el número total de páginas
        var totalPages = (int)Math.Ceiling((double)Pedidos.Count() / pageSize);
        ViewBag.TotalPages = totalPages;
        ViewBag.CurrentPage = page;
        
        return View();
    }
    public IActionResult NotificacionesFarmacia(){
        Farmacia usu = Farmacia.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Farmacia = usu;
        return View();
    }
    public IActionResult ComprarProducto(int IdProducto){
        Paciente usu = Paciente.FromString(HttpContext.Session.GetString("user"));
        if (usu == null)
        {  
            return RedirectToAction("Index","Home");
        }
        ViewBag.Paciente=usu;
        ViewBag.Producto=BD.BuscarProducto(IdProducto);
        ViewBag.Farmacia = BD.BuscarFarmacia(ViewBag.producto.IdFarmacia);
        return View();
    }
    public IActionResult Comprar(Producto prod, string Direccion){
        Paciente usu = Paciente.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        Farmacia farmacia = BD.BuscarFarmacia(prod.IdFarmacia);
        BD.AgregarPedido(prod, usu, Direccion, farmacia);
        return RedirectToAction("PedidosPaciente", "Home");
    }

    public IActionResult CrearReceta(Producto prod, string Direccion){
        Doctor usu = Doctor.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        DateTime thisDay = DateTime.Today;
        ViewBag.Fecha = thisDay;
        ViewBag.Doctor = usu;
        var pacientes = BD.BuscarPacientes(usu.IdDoctor);
        ViewBag.pacientes = pacientes;
        return View();
    }
    public IActionResult GuardarReceta(Receta usu)
    {
        Doctor doctor = Doctor.FromString(HttpContext.Session.GetString("user"));
        BD.AgregarReceta(usu, doctor.IdDoctor);
        return RedirectToAction("IndexConSessionDoctor");
    }
    public IActionResult HistorialRecetasDoctor(int page = 1)
    {
        Doctor usu = Doctor.FromString(HttpContext.Session.GetString("user"));
        if (usu== null)
        {  
            return RedirectToAction("Index","Home");
        }
        List<Receta> Recetas = BD.BuscarRecetasPorDoctor(usu.IdDoctor);
        ViewBag.Doctor = usu;

        const int pageSize = 4;

        // Paginar los recetas
        var recetasPaginados = Recetas.Skip((page - 1) * pageSize).Take(pageSize).ToList();
        ViewBag.Recetas = recetasPaginados;

        // Calcular el número total de páginas
        var totalPages = (int)Math.Ceiling((double)Recetas.Count() / pageSize);
        ViewBag.TotalPages = totalPages;
        ViewBag.CurrentPage = page;
        
        return View();
    }
}
