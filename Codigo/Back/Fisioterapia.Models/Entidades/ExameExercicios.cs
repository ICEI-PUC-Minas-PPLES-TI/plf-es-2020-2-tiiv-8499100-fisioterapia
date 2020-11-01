using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace Fisioterapia.Models.Entidades {
    public class ExameExercicios {
        public int IdExame { get; set; }
        public int IdExercios { get; set; }
        [ForeignKey("IdExame ")]
        public virtual Exames Exames { get; set; }
        [ForeignKey("IdExercios")]

        public virtual Exercicios Exercicios { get; set; }
    }
}
