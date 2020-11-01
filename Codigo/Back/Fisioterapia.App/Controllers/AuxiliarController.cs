using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Fisioterapia.App.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Fisioterapia.App.Models.auxiliar;
using Fisioterapia.Models.Entidades;
using Fisioterapia.App.Helpers;

namespace Fisioterapia.App.Controllers {
    [Route("[controller]")]
    [ApiController]
    public class AuxiliarController : BaseController{

        private IAuxiliarService _auxiliarService;
        private IMapper _mapper;
        public AuxiliarController(IAuxiliarService auxiliarService, IMapper mapper) {
            _auxiliarService = auxiliarService;
            _mapper = mapper;
        }

        [HttpPost("register_Aux")]
        public IActionResult Register([FromBody]ModelAuxiliar model) {
            _auxiliarService.Criar(model);
            return Ok(new { message = "Cadastrado com sucesso!" });
        }

        [HttpPut("{id}")]
        public IActionResult Update(int id, [FromBody] UpdateAuxiliar model) {

            try { _auxiliarService.Update(id, model);
                return Ok();
            } catch (AppException ex) 
            {
                return BadRequest(new { message = ex.Message });
            }
            
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(int id) {
            _auxiliarService.Delete(id);
            return Ok(new { message = "Auxiliar excluido  com  sucesso!" });
        }


    }
}
