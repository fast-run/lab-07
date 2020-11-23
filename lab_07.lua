lgi = require 'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab_07.glade')

ui = bld.objects

function ui.Canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1)
	cr:paint()

	for x = 1, 15 do
		for y = 1, 15 do

			cr:set_source_rgb(x / 15, y / 15, 0.5)
			cr:rectangle(x*45,y*45,30,30)
			cr:fill()
		end
	end
	
	return true
end


function ui.wnd:on_destroy(...)
	gtk.main_quit()
end

ui.wnd:show_all()

gtk.main()
