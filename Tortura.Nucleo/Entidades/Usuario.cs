using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortura.Nucleo.Persistencia;
using Tortura.Nucleo.Enumeradores;

namespace Tortura.Nucleo.Entidades {
    public class Usuario : Persistent {
        public override int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
        public DateTime FechaNacimiento{ get; set; }
        public TipoUsuario Tipo { get; set; }
    }
}
