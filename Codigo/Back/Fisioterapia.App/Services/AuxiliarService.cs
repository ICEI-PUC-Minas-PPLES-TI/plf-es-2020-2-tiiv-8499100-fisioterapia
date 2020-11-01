using AutoMapper;
using Fisioterapia.App.Helpers;
using Fisioterapia.App.Models.auxiliar;
using Fisioterapia.Models;
using Fisioterapia.Models.Entidades;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Fisioterapia.App.Services {
    public class AuxiliarService : IAuxiliarService {
        private readonly DataContext _context;
        private readonly IMapper _mappe;
        private readonly AppSettings _appSeiting;
        private readonly IEmailService _emailService;
        public AuxiliarService(DataContext context, IMapper mapper, IOptions<AppSettings> appSetting, IEmailService emailService) {
            _context = context;
            _mappe = mapper;
            _appSeiting = appSetting.Value;
            _emailService = emailService;

        }
        public ModelAuxiliarResponse Criar(ModelAuxiliar model) {
            var auxiliar = _mappe.Map<Auxiliar>(model);
            _context.Add(auxiliar);
            _context.SaveChanges();
            return _mappe.Map<ModelAuxiliarResponse>(auxiliar);
        }

        public void Delete(int id) {
            var auxiliar = getAuxiliar(id);
            _context.Auxiliars.Remove(auxiliar);
            _context.SaveChanges();
        }
        private Auxiliar getAuxiliar(int id) 
        {
            var auxiliar = _context.Auxiliars.Find(id);
            if (auxiliar == null) throw new KeyNotFoundException("Atleta não  encontrado!");
            return auxiliar;
        }

        public IEnumerable<ModelAuxiliarResponse> GetAll() {
            var auxiliar = _context.Auxiliars;
            return _mappe.Map<IList<ModelAuxiliarResponse>>(auxiliar);
        }

        public ModelAuxiliarResponse GetById(int id) {
            var auxiliar = getAuxiliar(id);
            return _mappe.Map<ModelAuxiliarResponse>(auxiliar);
        }

        public ModelAuxiliarResponse Update(int id, UpdateAuxiliar model) {
            var auxiliar = getAuxiliar(id);
            return _mappe.Map<ModelAuxiliarResponse>(auxiliar);
        }
    }
}
