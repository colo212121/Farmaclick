namespace LoginFarmaclick.Models;
public class SolicitudesParaSerPaciente
{
    public int IdPaciente { get; set; }
    public int IdDoctor { get; set; }
    public int IdSolicitud { get; set; }
    public bool Estado { get; set; }
}
