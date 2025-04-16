using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using LoginFarmaclick.Models;

namespace LoginFarmaclick.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;

    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }

    public IActionResult DatosLoginPaciente(string email, string contraseña)
    {
        Paciente usu = BD.IniciarSesionPaciente(email, contraseña);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("LoginPaciente");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionPaciente", "Home");
        }
    }
    public IActionResult DatosLoginDoctor(string email, string contraseña)
    {
        Doctor usu = BD.IniciarSesionDoctor(email, contraseña);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("LoginDoctor");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionDoctor", "Home");

        }
    }
    public IActionResult DatosLoginFarmacia(string email, string contraseña)
    {
        Farmacia usu = BD.IniciarSesionFarmacia(email, contraseña);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("LoginFarmacia");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionFarmacia", "Home");

        }    
    }
    public IActionResult LoginPaciente()
    {
        return View();
    }
    public IActionResult LoginDoctor()
    {
        return View();
    }
    public IActionResult LoginFarmacia()
    {
        return View();
    }
    public IActionResult RegistrarsePaciente()
    {
        return View();
    }
    public IActionResult RegistrarseDoctor()
    {
        return View();
    }
    public IActionResult RegistrarseFarmacia()
    {
        return View();
    }
    public IActionResult GuardarPaciente(Paciente usu)
    {
    
        BD.RegistrarPaciente(usu);
        HttpContext.Session.SetString("user", usu.ToString());
        return RedirectToAction("IndexConSessionPaciente", "Home", usu);
    }
    public IActionResult GuardarDoctor(Doctor usu)
    {
        BD.RegistrarDoctor(usu);
        HttpContext.Session.SetString("user", usu.ToString());
        return RedirectToAction("IndexConSessionDoctor", "Home", usu);
    }
    public IActionResult GuardarFarmacia(Farmacia usu)
    {
        BD.RegistrarFarmacia(usu);
        HttpContext.Session.SetString("user", usu.ToString());
        return RedirectToAction("IndexConSessionFarmacia", "Home", usu);
    }
    
    public IActionResult OlvideContraseñaPaciente(string email, string DNI)
    {
        return View("OlvideContraseñaPaciente", "Home");
    }
    public IActionResult OlvideContraseñaDoctor(string email, string Matricula)
    {
        return View("OlvideContraseñaDoctor", "Home");
    }

    public IActionResult OlvideContraseñaFarmacia(string email, string TituloPropiedad)
    {
        return View("OlvideContraseñaFarmacia", "Home");
    }

    public IActionResult DatosOlvidoPaciente(string email, string DNI)
    {
        Paciente usu = BD.RecuperarContraseñaPaciente(email, DNI);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("OlvideContraseñaPaciente");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionPaciente", "Home");
        }
    }

    public IActionResult DatosOlvidoDoctor(string email, string matricula)
    {
        Doctor usu = BD.RecuperarContraseñaDoctor(email, matricula);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("OlvideContraseñaDoctor");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionDoctor", "Home");
        }
    }

    public IActionResult DatosOlvidoFarmacia(string email, string tituloPropiedad)
    {
        Farmacia usu = BD.RecuperarContraseñaFarmacia(email, tituloPropiedad);
        if (usu == null)
        {
            ViewBag.Error =  "Login Incorrecto";
            return View("OlvideContraseñaFarmacia");
        }
        else
        {
            HttpContext.Session.SetString("user", usu.ToString());
            return RedirectToAction("IndexConSessionFarmacia", "Home");
        }
    }

    public IActionResult Logout()
    {
        HttpContext.Session.Remove("user");
        return RedirectToAction("Index","Home");
    }
}
