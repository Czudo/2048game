function paintingBoard(Z)
    cla
    e=0.05;
    grey=[187,173,160]./255;
    set(gca, 'Color', grey)
    for j=0:3
        for k=0:3
            x=[j+e, j+4*e/3, j+2*e,  j+1-2*e, j+1-4*e/3, j+1-e, j+1-e, j+1-4*e/3, j+1-2*e, j+2*e, j+4*e/3 ,j+e];
            y=[k+2*e, k+4*e/3, k+e, k+e, k+4*e/3, k+2*e, k+1-2*e, k+1-4*e/3, k+1-e, k+1-e, k+1-4*e/3, k+1-2*e];
            w=color(Z(j+1,4-k));
            patch(x,y,w, 'EdgeColor', grey)
            if Z(j+1,4-k)~=0
                if Z(j+1,4-k)<8
                    text(j+0.5,k+0.5,int2str(Z(j+1,4-k)),'FontSize',20,...
                        'Color',[119,110,101]./255,'FontWeight','Bold','HorizontalAlignment','Center') 
                else
                    if Z(j+1, 4-k)>65536
                        size=16;
                    elseif Z(j+1,4-k)>8192
                            size=18;
                    else
                        size=20;
                    end
                    text(j+0.5,k+0.5,int2str(Z(j+1,4-k)),'FontSize',size,...
                        'Color',[255,255,255]./255,'FontWeight','Bold','HorizontalAlignment','Center') 
                end
            end
         end
     end
     axis([0-e 4+e 0-e 4+e])
     set(gca,'Xtick',[],'XTicklabel',[])
     set(gca,'Ytick',[],'YTicklabel',[])
     
     hold off
  

