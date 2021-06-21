using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tortura.Nucleo.Persistencia;

namespace Tortura.Nucleo.Entidades {
    public class Lugar : Persistent {
        public  override int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Ciudad { get; set; }
        public string Estado { get; set; }

    }
}
