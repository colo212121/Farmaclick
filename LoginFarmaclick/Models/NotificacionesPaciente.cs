namespace LoginFarmaclick.Models;
public class NotificacionesPaciente
{
    public int IdNotificacion { get; set; }
    public int IdPaciente { get; set; }
    public int IdDoctor { get; set; }
    public string Contenido { get; set; }
}
