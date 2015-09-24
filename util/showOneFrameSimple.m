function showOneFrameSimple( t,num_frames,data_mat,label_simple_mat )
    set(gca,'position',[0 0 1 0.97]);
    data = squeeze(data_mat.data(:,:,:,t));
    label_simple = label_simple_mat.label_simple(:,t);
    imshow(data)
    title(sprintf('Viewing frame %d / %d , label = %d',t,num_frames,label_simple))
    fprintf('Viewing frame %d / %d , label = %d\n',t,num_frames,label_simple);
end