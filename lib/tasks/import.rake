#require 'config/environment'
require 'csv'
require 'roo-xls'

namespace :utils do

desc "import gnvls"
task :import_gnvls => :environment do

  res=[]
  rr={}

  spreadsheet = Roo::Spreadsheet.open('./1.xls')
  #header = Roo::Excel.new("./1.xls")
  # A - МНН
  # B -Торговое наименование лекарственного препарата
  # C - Лекарственная форма, дозировка, упаковка (полная)
  # D - Владелец РУ/производитель/упаковщик/Выпускающий контроль
  # E - "Коли-чество в потреб. упаков-ке"
  # F - Предельная цена руб. без НДС
  # G - Цена указана для первич. упаковки
  # H -№ РУ
  # I -"Дата регистрации цены(№ решения)"
  # J - Штрих-код (EAN13)
  # K - АТХ
  # L - Уровень наценки, % OPT
  # M - Предельная оптовая цена, руб. с НДС OPT
  # N - Уровень наценки, % ROZ
  # O - Предельная розничная цена, руб. с НДС ROZ


  Gnvl.destroy_all

   (4..spreadsheet.last_row).each do |row|
     gnvls = Gnvl.new
     gnvls.mnn = spreadsheet.cell('A',row)
     gnvls.name = spreadsheet.cell('B',row)
     gnvls.lekform = spreadsheet.cell('C',row)
     gnvls.owner = spreadsheet.cell('D',row)
     gnvls.qntpack = spreadsheet.cell('E',row)
     gnvls.prc_wo_nds = spreadsheet.cell('F',row)
     gnvls.prc_first_pack = spreadsheet.cell('G',row)
     gnvls.n_py = spreadsheet.cell('H',row)
     gnvls.date_reg = spreadsheet.cell('I',row)
     gnvls.ean13 = spreadsheet.cell('J',row)
     gnvls.atx = spreadsheet.cell('K',row)
     gnvls.level_nac_opt = spreadsheet.cell('L',row)
     gnvls.pred_opt_price = spreadsheet.cell('M',row)
     gnvls.level_nac_rozn = spreadsheet.cell('N',row)
     gnvls.pred_rozn_price = spreadsheet.cell('O',row)
     gnvls.save
     puts 'save'+row.to_s
   end


end # impor_cmp


end
