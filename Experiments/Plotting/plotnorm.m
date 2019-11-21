function plotnorm()
    set(gcf, 'unit', 'inches', 'color','w');
    figure_size =  get(gcf, 'position');
    h_legend = legend;
    set(h_legend, 'location', 'eastoutside');
    set(h_legend, 'unit', 'inches');
    legend_size = get(h_legend, 'position');
    figure_size(3) = figure_size(3) + legend_size(3);
    set(gcf, 'position', figure_size);
end

%set(gcf,'color','w');