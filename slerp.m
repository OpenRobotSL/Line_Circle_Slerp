% 计算插补点数
stepNum = round(r*theta13/step);
p_i = zeros(4,stepNum+1);
        
%判断路径,取路径短的，不影响方向
cosa = p1_Q(1)*p3_Q(1)+p1_Q(2)*p3_Q(2)+p1_Q(3)*p3_Q(3)+p1_Q(4)*p3_Q(4);
if cosa < 0
    p3_Q = -p3_Q;
end

sina = sqrt(1 - cosa*cosa);
angle = atan2( sina, cosa );
for step = 0:1: stepNum
    k0 = sin((1-step/stepNum)*angle)/sina;
    k1 = sin(step/stepNum*angle)/sina;
    pt_Q(:,step+1) = (p1_Q*k0 +p3_Q*k1)/norm(p1_Q*k0 + p3_Q*k1);
end
