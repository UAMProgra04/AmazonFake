using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Entidades_BD
{
    public class Cls_Entidad_Ventas_DAL
    {
        private string _codigo;
        private string _fecha;
        private decimal _subtotal;
        private decimal _igv;
        private decimal _total;
        private string _cliente;
        private string _Respuesta;

        public string Codigo
        {
            get
            {
                return _codigo;
            }

            set
            {
                _codigo = value;
            }
        }

        public string Fecha
        {
            get
            {
                return _fecha;
            }

            set
            {
                _fecha = value;
            }
        }

        public decimal Subtotal
        {
            get
            {
                return _subtotal;
            }

            set
            {
                _subtotal = value;
            }
        }

        public decimal Igv
        {
            get
            {
                return _igv;
            }

            set
            {
                _igv = value;
            }
        }

        public decimal Total
        {
            get
            {
                return _total;
            }

            set
            {
                _total = value;
            }
        }

        public string Cliente
        {
            get
            {
                return _cliente;
            }

            set
            {
                _cliente = value;
            }
        }

        public string Respuesta
        {
            get
            {
                return _Respuesta;
            }

            set
            {
                _Respuesta = value;
            }
        }

        public Cls_Entidad_Ventas_DAL()
        {
        }

        public Cls_Entidad_Ventas_DAL(string ccodigo)
        {
            _codigo = ccodigo;
        }

        public Cls_Entidad_Ventas_DAL(string ccodigo, string cfecha, decimal csubtotal, decimal cigv, decimal ctotal, string ccliente)
        {
            _codigo = ccodigo;
            _fecha = cfecha;
            _subtotal = csubtotal;
            _igv = cigv;
            _total = ctotal;
            _cliente = ccliente;
        }
    }
}
