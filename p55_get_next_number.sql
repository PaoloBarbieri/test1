create procedure p55_get_next_number(@v_str varchar(6), @v_type varchar(4), @v_ret varchar(10) output) as
begin

  declare @num int = 0;

  select @num = num from commonnumbermanager where type = @v_type;
  
  if @num = null
  begin
    set @v_ret = null;
    return;
  end
  
  update f55_commonnumbermanager
  set num = @num + 1
  where type = @v_type;
  
  set @v_ret = @v_type + dbo.p55_get_next_number2(@v_str, @num);
  
  return;  
end;
