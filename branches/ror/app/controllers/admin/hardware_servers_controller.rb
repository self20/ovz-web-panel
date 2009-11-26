class Admin::HardwareServersController < AdminController
  
  def list
    @up_level = '/admin/dashboard'
  end
  
  def list_data
    @hardware_servers = HardwareServer.all
    @hardware_servers.map! { |item| {
      :id => item.id,
      :host => item.host,
      :description => item.description
    }}
    render :json => { :data => @hardware_servers }  
  end
  
  def connect
    @hardware_server = HardwareServer.new(params)
    
    if @hardware_server.connect
      render :json => { :success => true }  
    else
      render :json => { :success => false, :errors => @hardware_server.errors }
    end
  end
  
  def disconnect
    @hardware_server = HardwareServer.find(params[:id])  
   
    if @hardware_server.disconnect  
      render :json => { :success => true }  
    else  
      render :json => { :success => false }  
    end  
  end
  
end