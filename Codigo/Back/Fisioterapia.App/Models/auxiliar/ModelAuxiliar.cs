using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Models.auxiliar {
    public class ModelAuxiliar {

        public string Instituicao { get; set; }
        public int Periodo { get; set; }
        public DateTime Expiracao { get; set; }
        public int IdUsuario { get; set; }
        public string CPF { get; set; }
    }
}
